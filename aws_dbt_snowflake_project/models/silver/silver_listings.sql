select
    host_id,
    listing_id,
    property_type,
    room_type,
    city,
    country,
    bedrooms,
    accommodates,
    bathrooms,
    price_per_night,
    {{ tag('price_per_night') }} as price_per_night_tag,
    created_at
from {{ ref('bronze_listings') }}
