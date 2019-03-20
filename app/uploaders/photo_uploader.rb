class PhotoUploader < CarrierWave::Uploader::Base
include  Cloudinary::CarrierWave

process aeager: true
process convert: 'jpg'
end
