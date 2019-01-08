# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Tag.create(name: "Wall")
# Tag.create(name: "Roof")
# Tag.create(name: "Foundation")
# Tag.create(name: "Footing")
# Tag.create(name: "Window")
# Tag.create(name: "Door")
# Tag.create(name: "Floor")
cat_bldg_ght_area = ReviewCategory.create(name: "BUILDING HEIGHT AND AREA", order: 1)

questions = ReviewQuestion.create(
    [
        { body: 'Storeys above grade', code_reference: '2.1.1.3', order: 1, review_category: cat_bldg_ght_area },
        { body: 'Gross Area', code_reference: '2.1.1.3', order: 2, review_category: cat_bldg_ght_area },
        { body: 'Room and space dimensions', code_reference: '9.5', order: 3, review_category: cat_bldg_ght_area },
        { body: 'Shoring details', code_reference: '9.12.1.4 ', order: 4, review_category: cat_bldg_ght_area }
    ]
)

cat_fire = ReviewCategory.create(name: "FIRE SAFETY PROTECTION", order: 2)

questions = ReviewQuestion.create(
    [
        { body: '% of unprotected openings', code_reference: '9.10.14.1 to 9.10.14.10', order: 1, review_category: cat_fire },
        { body: 'F.R.R. of external wall and construction non-combustible cladding where LD<600mm', code_reference: '9.10.14.11 & 9.10.14.12', order: 2, review_category: cat_fire },
        { body: 'F.R.R. of external wall and construction, dwelling above another', code_reference: '9.10.14.11', order: 3, review_category: cat_fire },
        { body: 'Protected openings', code_reference: '9.10.14.5', order: 4, review_category: cat_fire },
        { body: 'Rating for Closures', code_reference: '9.10.13.1', order: 5, review_category: cat_fire }
    ]
)