db.ingredient.aggregate([
{$match:{category:"topping"}},
{$lookup:{from:"foodInfoToppings",
           localField:"ingName",
           foreignField:"display_name",
           as:"topping_docs"}},
{$unwind:"$topping_docs"},
{$lookup:{from:"unit",
          localField:"topping_docs.portion_display_name",
          foreignField:"unitName",
          as:"unit_docs"}},
{$unwind:"$unit_docs"},
{$project:{_id:1,
           ingName:1,
           "topping_docs.portion_display_name":1,
           "topping_docs.calories":1,
           "unit_docs.ounces":1,
           calPerOunce:{$divide:["$topping_docs.calories","$unit_docs.ounces"]}}},
{$sort:{calPerOunce:-1}},
{$limit:3}
]).pretty()