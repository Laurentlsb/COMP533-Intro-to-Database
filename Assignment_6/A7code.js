//1.Query
//1.1
db.foodInfo.findOne();

//1.2
db.foodInfo.find({portion_display_name:"regular Oreo"}).pretty();

//1.3
db.foodInfo.find({display_name:{$regex:/ice cream/i},calories:{$lt:200}}).pretty();

//1.4
db.truckEvent.find({eventStart:{$lt:"2017-09-07"}}).sort({eventStart:-1}).limit(5).pretty();

//1.5
db.sale.aggregate([{$match:{eventId:16}},{$group:{_id:null, num_order:{$sum:1}}}]).pretty();

//1.6
//(a)
db.truckEvent.update({"eventName":"Pi Day"},{"$set":{"eventName":"Pie Day"}});

//(b)
db.truckEvent.find({$or:[{"eventName":"Pi Day"},{"eventName":"Pie Day"}]}).pretty();

//(c)
db.truckEvent.update({"eventName":"GSA Coffee Break"},{"$set":{"eventName":"GSA Study Break"}},{multi:true});

//(d)
db.truckEvent.find({$or:[{"eventName":"GSA Study Break"},{"eventName":"GSA Coffee Break"}]}).count();

//1.7
//(a)
db.foodInfo.aggregate([{$match:{category:"topping"}},{$project:{display_name:1,portion_display_name:1,calories:1}},{$out:"foodInfoToppings"}]);

//(b)
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
    ]).pretty();

//2 Streaming Twitter Data

//missing code in getIceCreamTweets.py :
datajson['retrieved'] = datetime.now()
destCollection.insert_one(datajson)

//2.1
db.icecream.update({"netId":{$exists:false}},{"$set":{"netId":"sl125"}},false,true)

//2.2
db.icecream.find({$where:"this.text.length > 140"}).count()

//2.3
db.icecream.find(
    {$or:[
        {text:{$regex:/#foodtruck/}},
        {"extended_tweet.full_text":{$regex:/#foodtruck/}}]}).count()

//2.4
db.icecream.aggregate([
    {$match:{"user.location":{$ne:null}}},
    {$group:{"_id":"$user.location", count:{$sum:1}}},
    {$sort:{count:-1,"_id":1}},
    {$limit:5}])

//2.5
db.icecream.find({"retweet_count":{$gt:0}}).count()

//2.6
db.icecream.aggregate({$group:{_id:null,num_followers:{$max:"$user.followers_count"}}})

//2.7
//mongoexport --db ricedb --collection icecream --out D:\icecream_sl125.json --username ricedb --password 522238830
