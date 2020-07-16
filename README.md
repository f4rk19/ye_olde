# DB design
## Users table

|Column|Type|Option|
|————|——-|———-|
|name|string|null: false, index: true, unique: true|
|email|string|null: false, index: true, unique: true|
|image|string|———|

### Association
- has_many :photos


## Photos table
|Column|Type|Option|
|————|——-|———-|
|content|string|null-----|
|image|string|null—|
|user|references|foreign_key: true, null: false|
|hashtag|references|foreign_key: true|

###Association
- belongs_to :user
- has_many:hashtags, through:hashtags_photos
- has_many:hashtags_photos


## Hashtags table
|Column|Type|Option|
|————|——-|———-|
|hashname|string|———|
|photo|references|foreign_key: true, null:false|

###Association
- has_many:photos, through: hashtags_photos
- has_many:hashtags_photos


## Hashtags_photos table
|Column|Type|Option|
|————|——-|———-|
|photo|references|foreign_key: true, null: false|
|hashname|references|foreign_key: true, null: false|

###Association
- belongs_to :photo
- belongs_to:hashtag
