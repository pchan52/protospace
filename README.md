== README

##TABLE
-prototypes
    -name           :string
    -concept        :text
    -catch_copy     :text
    -likes_count    :integer
    -user_id        :integer

-users
    -name       :string
    -works      :text
    -profile    :text
    -avatar     :text
    -email      :string
    -password   :string
    -member     :string

-images
    -prototype_id   :integer
    -image          :text
    -status         :integer

-comments
    -comment        :text
    -user_id        :integer
    -prototype_id   :integer

-likes
    -user_id            :integer
    -prototype_id       :integer


##ASSOCIATION

-prototype
    -has_many      :images
    -has_many      :comments
    -has_many      :likes
    -belongs _to   :user

-user
    -has_many   :prototypes
    -has_many   :comments
    -has_many   :likes

-image
    -belongs_to     :prototype
    -enum %i(main sub)

-comment
    -belongs_to     :prototype
    -belongs_to     :user

-like
    -belongs_to     :prototype
    -belongs_to     :user
