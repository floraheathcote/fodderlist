User.create!([
  {id: 1, email: "flora.heathcote@gmail.com", encrypted_password: "$2a$12$fkx1ia3QJ86bM1HFW0divOshke6YK.tMbxGj2dkGso5jXZZmGhIuC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, first_name: "Flora", last_name: "Heathcote", announcements_last_read_at: nil, admin: false, created_at: "2021-03-05 21:15:49", updated_at: "2021-03-05 21:15:49"}
])
IngredientCategory.create!([
  {id: 1, name: "Meat", created_at: "2021-03-05 21:40:34", updated_at: "2021-03-05 21:40:34"},
  {id: 2, name: "Fruit & Veg", created_at: "2021-03-05 21:41:11", updated_at: "2021-03-05 21:41:11"},
  {id: 3, name: "Bakery", created_at: "2021-03-05 21:41:19", updated_at: "2021-03-05 21:41:19"}
])
Ingredient.create!([
  {id: 2, name: "Apples", ingredient_category_id: 2, created_at: "2021-03-05 21:58:01", updated_at: "2021-03-05 22:07:08"},
  {id: 1, name: "Beef fillet", ingredient_category_id: 1, created_at: "2021-03-05 21:46:17", updated_at: "2021-03-05 22:20:56"},
  {id: 3, name: "Chicken breast", ingredient_category_id: 1, created_at: "2021-03-05 22:40:14", updated_at: "2021-03-05 22:40:14"}
])
Pin.create!([
  {id: 1, description: "flooring", user_id: 1, created_at: "2021-03-05 21:16:08", updated_at: "2021-03-05 21:16:08"},
  {id: 2, description: "taps", user_id: 1, created_at: "2021-03-05 23:16:23", updated_at: "2021-03-05 23:16:23"},
  {id: 3, description: "tiles", user_id: 1, created_at: "2021-03-05 23:16:50", updated_at: "2021-03-05 23:16:50"},
  {id: 4, description: "bath", user_id: 1, created_at: "2021-03-05 23:17:06", updated_at: "2021-03-05 23:17:06"},
  {id: 5, description: "paint", user_id: 1, created_at: "2021-03-05 23:17:21", updated_at: "2021-03-05 23:17:21"},
  {id: 6, description: "fdaf", user_id: 1, created_at: "2021-03-05 23:17:34", updated_at: "2021-03-05 23:17:34"}
])
ActiveStorage::Blob.create!([
  {id: 1, key: "mmfbe7dmmaz99w4vrcqp2e2ugzkf", filename: "Screenshot 2020-10-15 at 20.36.55.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 1136644, checksum: "hqhhG6MSTrLEpFWAnou9aA==", created_at: "2021-03-05 21:16:08"},
  {id: 2, key: "p8oe9ujp28ugvw5hjkp61d1gjmbf", filename: "fillet-steak.jpg", content_type: "image/jpeg", metadata: {}, byte_size: 335375, checksum: "Omdt06+QA+WWXuUnzXSOfg==", created_at: "2021-03-05 21:45:54"},
  {id: 3, key: "wlqmi1x2xnrl4zmwdu9rhin4oha6", filename: "fillet-steak.jpg", content_type: "image/jpeg", metadata: {}, byte_size: 335375, checksum: "Omdt06+QA+WWXuUnzXSOfg==", created_at: "2021-03-05 21:46:17"},
  {id: 4, key: "0xrtq4p871y1v1koh8egcrj03se0", filename: "download.jpeg", content_type: "image/jpeg", metadata: {}, byte_size: 3784, checksum: "LEQydKmMEyPyJ+LhuIxwGQ==", created_at: "2021-03-05 21:58:01"},
  {id: 5, key: "53hvekvdf33uqu5hhudemyqe9lk8", filename: "download.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 3784, checksum: "LEQydKmMEyPyJ+LhuIxwGQ==", created_at: "2021-03-05 22:07:08"},
  {id: 6, key: "j726e5moiqts026phitrf35dvgiz", filename: "fillet-steak.jpg", content_type: "image/jpeg", metadata: {"identified"=>true}, byte_size: 335375, checksum: "Omdt06+QA+WWXuUnzXSOfg==", created_at: "2021-03-05 22:20:56"},
  {id: 7, key: "g3b056sqm48f3ma31lo24awqzmbg", filename: "Screenshot 2020-10-15 at 17.04.10.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 162217, checksum: "GtPNqUmZiUItF/4wgSRkLw==", created_at: "2021-03-05 23:16:23"},
  {id: 8, key: "evd1tpyahr4v40xbq2vy1gk2kjn2", filename: "Screenshot 2020-11-25 at 12.17.34.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 634625, checksum: "W1xS7Hddj0fOVPPN9SCXNQ==", created_at: "2021-03-05 23:16:50"},
  {id: 9, key: "q344r7q0oxyubrwfi2tzfccy5upn", filename: "Screenshot 2020-10-14 at 09.39.43.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 477951, checksum: "6MOgEyvLR7PcP+F2PhTjNg==", created_at: "2021-03-05 23:17:06"},
  {id: 10, key: "ra5cjv3lz4mgvgcgtz2wlkdkxkr7", filename: "Screenshot 2020-08-31 at 18.23.47.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 95388, checksum: "mCsPbNX+rOxkNX8Bd+Uy+w==", created_at: "2021-03-05 23:17:21"},
  {id: 11, key: "mn65lxwno1s378zyl85ru3x5h456", filename: "Screenshot 2020-08-27 at 21.12.19.png", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 1250617, checksum: "W4w6iZnBnyuX8kS9c8OKlQ==", created_at: "2021-03-05 23:17:34"}
])
ActiveStorage::Attachment.create!([
  {id: 1, name: "pin_image", record_type: "Pin", record_id: 1, blob_id: 1, created_at: "2021-03-05 21:16:08"},
  {id: 2, name: "main_image", record_type: "Ingredient", record_id: 2, blob_id: 5, created_at: "2021-03-05 22:07:08"},
  {id: 3, name: "main_image", record_type: "Ingredient", record_id: 1, blob_id: 6, created_at: "2021-03-05 22:20:56"},
  {id: 4, name: "pin_image", record_type: "Pin", record_id: 2, blob_id: 7, created_at: "2021-03-05 23:16:23"},
  {id: 5, name: "pin_image", record_type: "Pin", record_id: 3, blob_id: 8, created_at: "2021-03-05 23:16:50"},
  {id: 6, name: "pin_image", record_type: "Pin", record_id: 4, blob_id: 9, created_at: "2021-03-05 23:17:06"},
  {id: 7, name: "pin_image", record_type: "Pin", record_id: 5, blob_id: 10, created_at: "2021-03-05 23:17:21"},
  {id: 8, name: "pin_image", record_type: "Pin", record_id: 6, blob_id: 11, created_at: "2021-03-05 23:17:34"}
])
