//
//  PhotoAlbum.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/13.
//

import UIKit
import Photos

final class PhotoAlbum {
    // MARK: - Single Skeleton
    // 如果你需要在初始化时进行额外设置，你可以将一个闭包的调用结果分配给全局的常量。
    static let shared: PhotoAlbum = {
        let photoAlbum = PhotoAlbum()
        // setup code
        if let assetCollection = photoAlbum.fetchAssetCollectionForAlbum() {
            photoAlbum.assetCollection = assetCollection
        }
        return photoAlbum
    }()

    private init() {} // 这样可以防止其他对象使用这个类的默认 '()' 初始化器。

    // MARK: - Public
    static let name = "Monotone"

    // MARK: - Private
    private var assetCollection: PHAssetCollection!

    // MARK: - Public Functions

    func checkAuthorization() -> Bool {
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
            PHPhotoLibrary.requestAuthorization { authorizationStatus in
                if authorizationStatus == .authorized {
                    self.creatAlbum()
                } else {
                    MessageCenter.shared.showMessage(title: NSLocalizedString("uns_photo_ablum_no_authoration_title", comment: "Oops, there was a problem of authentication..."), 
                                                     body: NSLocalizedString("uns_photo_ablum_no_authoration_description", comment: "Allow Monotone to access your photos in \"Settings > Privacy > Photos\""),
                                                     theme: .error,
                                                     buttonText: NSLocalizedString("uns_photo_ablum_no_authoration_btn_to_system_settings", comment: "Settings"), 
                                                     buttonTapHandler: {
                        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }

                        if UIApplication.shared.canOpenURL(settingsUrl) {
                            UIApplication.shared.open(settingsUrl)
                        }
                    })
                }
            }
        }

        guard PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized else { return false }
        return true
    }

    func save(image: UIImage) {
        guard self.checkAuthorization() else { return }
        guard self.assetCollection != nil else { return }

        PHPhotoLibrary.shared().performChanges {
            let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
            let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset!
            let albumChangeRequest = PHAssetCollectionChangeRequest(for: self.assetCollection)
            albumChangeRequest?.addAssets([assetPlaceholder] as NSArray)
        }
    }

    // MARK: - Private Functions

    private func creatAlbum() {
        PHPhotoLibrary.shared().performChanges {
            PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: PhotoAlbum.name)
        } completionHandler: { success, _ in
            if success {
                self.assetCollection = self.fetchAssetCollectionForAlbum()
            }
        }
    }

    private func fetchAssetCollectionForAlbum() -> PHAssetCollection! {
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "title = %@", PhotoAlbum.name)

        let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: options)

        if let assetCollection = collection.firstObject {
            return assetCollection
        }

        return nil
    }
}
