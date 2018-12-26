# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
Product.delete_all
Product.create(
  id: 1,
  title: '2018年 嘉東李媽媽青果社 帝王柑',
  name: '帝王柑',
  description: '「帝王柑」的前身是「山東貢橘」，是以前帝王家御用美食。
帝王柑從大陸引進台灣栽種已數年之久。本青果社為了讓果實風味更符國人期許，參加產銷班進行農產改良，並在空氣、水源具足的豐沃土地上種植，得天獨厚的生長環境，栽種出果皮薄、汁多、口感細緻的「帝王柑」。
帝王柑果實玲瓏可愛，貌似柳丁的橘子，平均體積比茂谷柑還小一號，皮薄好剝，果肉比柳丁細嫩，剝開聞著有有淡淡柑橘、檸檬的果香味，所有的香氣都縮在這一顆小果實中。歡迎來嚐鮮！！',
  description_2: '我們按訂單先後出貨，可以先下單排程，出貨前我們會通知。 按登記先後順序安排出貨～ 1.禮盒分享7斤裝 (運費另計) 原價750元，優惠價600元/箱 2.團購分享20斤裝 (運費另計) 原價1,600元，優惠價1,200元/箱 A.禮盒分享運費： 1-2箱→100元 3-4箱→200元 以此類推 B.團購分享運費： 1箱→100元 2箱→200元 以此類推 歡迎個人、公司、團體訂購，提早來電詢問洽詢。 消費者如有特殊需求品項，也提供客製化服務唷。',
  price: 600,
  calculate: '1000',
  status: 1
)

product = Product.find 1

image = product.images.build
image.remote_file_url = 'https://3.bp.blogspot.com/-83eq67dcVAo/W9CLGToXEaI/AAAAAAAABXM/kQxeDYcxdR8jw5VHvGqAS7--pRWkb7ZIgCLcBGAs/s1600/42498685_993170037521648_1148127560895299584_n.jpg'
image.save

image = product.images.build
image.remote_file_url = 'https://1.bp.blogspot.com/-4hbh15y36rU/WBDSodQn3qI/AAAAAAAAA-U/YboZSgFa70Uxu13sBho_WCIBmrjHMZEmQCPcBGAYYCw/s640/10317564_335357043302954_7265161469785899921_o.jpg'
image.save

image = product.images.build
image.remote_file_url = 'https://3.bp.blogspot.com/-sgJJhd5TBK4/WBDSpSSN2TI/AAAAAAAAA-U/ZQp-ijr_Jj8TaQDS7ANtXCiwYm_qnafkwCPcBGAYYCw/s1600/12095196_464127510425906_8738491544672911023_o.jpg'
image.save

Article::Category.create(
  [
    { name: '嘉東李媽媽青果社' },
    { name: '最新消息' },
    { name: '茂谷柑' },
    { name: '帝王柑' },
    { name: '西施柚' },
    { name: '斗六文旦' },
    { name: '紅肉火龍果' },
    { name: '養生銀耳蓮子湯' }
  ]
)


