use VanLich

db.createCollection("Content")
db.Content.insertOne({ name: "SchemeHolding", debug: true, useID:"hold", mainGraphicUrl: "hold", nOfStars: 1, nOfFavs: 1, nOfComments: 1, nOfShare: 1, caption: "Hold", description:
 "Hold", content: "Content Holding", type: "story", catagories: ["story", "batrieu", "lichsu"], createDate: new Date(), graphics:[] })

 db.createCollection("User")
 db.User.insertOne({ name: "admin", email: "21521109@gm.uit.edu.vn", password: "hashfunction", avatarUrl: "http", contentIds: [], favContenIds: [], starContentIds: [], saveContentIds: [], commentIds: [] })

 db.createCollection("Comment")
db.Comment.insertOne({ userId: "admin", commentId: "hold", text: "Comment", nOfLikes: 1, nOfChildComments: 0, parentCommentIds: "holdID", createDate: new Date() })

db.createCollection("Collection")
