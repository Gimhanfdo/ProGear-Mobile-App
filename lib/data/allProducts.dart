import 'package:progear_app/models/product.dart';

class Allproducts {

  static List<Product> getProductsByCategory(String category) {
    switch (category) {
      case 'Bat':
        return cricketBats;
      case 'Ball':
        return cricketBalls;
      case 'Helmet':
        return cricketHelmets;
      case 'Other':
        return otherEquipment;
      default:
        return [];
    }
  }

  static List<Product> discountedProducts = [
    Product(
      productID: 2,
      productName: 'Kookaburra Ultimate Bat',
      productBrand: 'Kookaburra',
      category: 'Bat',
      price: 130000,
      productImage:
          'https://commercebuild-175c7.kxcdn.com/cdn-d03d5231-5b2e278c.commercebuild.com/cf738e9579802e6b988bb225ca6bc00c/contents/2A25190C/thumbnail/middle_2A25190C-Ghost-Pro-Shadow.jpg?quality=65',
      description: 'Recommended for professional cricketers',
      discountPercentage: 10,
      quantityAvailable: 0,
    ),

    Product(
      productID: 9,
      productName: 'New Balance TC 1260',
      productBrand: 'New Balance',
      category: 'Bat',
      price: 132000,
      productImage: 'https://m.media-amazon.com/images/I/41pwCXcyd3L.jpg',
      description: 'High-quality bat for all players.',
      discountPercentage: 5,
      quantityAvailable: 20,
    ),

    Product(
      productID: 20,
      productName: 'SG Bouncer Leather Ball (Red)',
      productBrand: 'SG',
      category: 'Ball',
      price: 5472,
      productImage:
          'https://shop.teamsg.in/cdn/shop/files/1_17c95107-a7f4-4054-8739-1d8b39d584a4.png?v=1720243084&width=1946',
      description:
          'A four-piece leather ball designed to perform well on bouncier pitches, offering good seam and bounce.',
      discountPercentage: 5,
      quantityAvailable: 35,
    ),

    Product(
      productID: 26,
      productName: 'Shrey Masterclass Air 2.0 Steel Helmet',
      productBrand: 'Shrey',
      category: 'Helmet',
      price: 45000,
      productImage:
          'https://kingsgrovesports.com.au/cdn/shop/products/masterclass-air-2.0-titanium-black_400x.jpg?v=1569212722',
      description:
          'A professional-grade helmet with a strong steel grille, known for comfort and advanced airflow.',
      discountPercentage: 5,
      quantityAvailable: 20,
    ),
  ];

  static List<Product> cricketBats = [
    Product(
      productID: 1,
      productName: 'Kookaburra Pro Cricket Bat',
      productBrand: 'Kookaburra',
      category: 'Bat',
      price: 112500,
      productImage:
          'https://images-na.ssl-images-amazon.com/images/I/51RRZPv7DYL._SS400_.jpg',
      description:
          'The Kookaburra Pro Cricket Bat (2025 Edition) is designed for professional cricketers who demand peak performance. Experience exceptional power, precision, and balance with this top-tier bat.',
      discountPercentage: null,
      quantityAvailable: 20,
    ),

    Product(
      productID: 2,
      productName: 'Kookaburra Ultimate Bat',
      productBrand: 'Kookaburra',
      category: 'Bat',
      price: 130000,
      productImage:
          'https://commercebuild-175c7.kxcdn.com/cdn-d03d5231-5b2e278c.commercebuild.com/cf738e9579802e6b988bb225ca6bc00c/contents/2A25190C/thumbnail/middle_2A25190C-Ghost-Pro-Shadow.jpg?quality=65',
      description:
          'Unleash your full potential with the Kookaburra Ultimate Bat, a pinnacle of cricketing excellence. Specifically recommended for professional cricketers, this bat is engineered for supreme power and unparalleled stroke play.',
      discountPercentage: 10,
      quantityAvailable: 0,
    ),

    Product(
      productID: 3,
      productName: 'SG Sunny Tonny English Willow',
      productBrand: 'SG',
      category: 'Bat',
      price: 112500,
      productImage:
          'https://shop.teamsg.in/cdn/shop/files/7_da98333b-4c2c-4a8f-ba8e-2868886f4a90.png?v=1745323268&width=1946',
      description:
          "This high-quality bat is meticulously crafted for players of all levels, from aspiring amateurs to seasoned professionals. Made from premium English Willow, it offers excellent pick-up, a large sweet spot, and superb rebound, allowing you to play a wide range of shots with confidence. Whether you're driving through the covers or hitting towering sixes, the SG Sunny Tonny is designed to enhance your performance.",
      discountPercentage: null,
      quantityAvailable: 8,
    ),

    Product(
      productID: 4,
      productName: 'MRF Genius Chase Master',
      productBrand: 'MRF',
      category: 'Bat',
      price: 130000,
      productImage:
          'https://isportscricket.com/wp-content/uploads/2023/09/MRF-GENIUS-CHASE-MASTER-2.png',
      description:
          "This high-quality bat is designed for players who aspire to greatness, offering a fantastic blend of power and maneuverability suitable for all skill levels. With its superior balance and robust construction, the MRF Genius Chase Master enables dynamic stroke play and effortless timing. Trusted by top cricketers, this bat is your key to unlocking peak performance on the field.",
      discountPercentage: null,
      quantityAvailable: 35,
    ),

    Product(
      productID: 5,
      productName: 'Kookaburra Kahuna Pro',
      productBrand: 'Kookaburra',
      category: 'Bat',
      price: 125000,
      productImage:
          'https://cdn-d03d5231-5b2e278c.commercebuild.com/cf738e9579802e6b988bb225ca6bc00c/contents/2A25130C/2A25130C-Kahuna-Pro-Front.jpg',
      description:
          "A high-quality bat engineered for players who demand excellence. While suitable for all players, its 'Pro' designation hints at its superior craftsmanship and performance capabilities. The Kahuna Pro offers a powerful hitting zone and excellent pick-up, allowing for aggressive and precise stroke play. This bat is a testament to Kookaburra's commitment to quality and innovation.",
      discountPercentage: null,
      quantityAvailable: 1,
    ),

    Product(
      productID: 6,
      productName: 'Gray-Nicolls Powerbow',
      productBrand: 'Gray-Nicolls',
      category: 'Bat',
      price: 120000,
      productImage:
          'https://www.maceysports.co.uk/cdn/shop/products/powerbow_thunder.jpg?v=1564682669',
      description:
          "This high-quality bat is designed to maximize your hitting potential, making it an excellent choice for players across all skill levels. The unique Powerbow design enhances the sweet spot and provides an incredible feel, allowing for powerful and effortless shot-making. Experience the renowned craftsmanship and performance that Gray-Nicolls is known for.",
      discountPercentage: null,
      quantityAvailable: 28,
    ),

    Product(
      productID: 7,
      productName: 'SS Ton Gladiator',
      productBrand: 'SS',
      category: 'Bat',
      price: 110000,
      productImage:
          'https://m.media-amazon.com/images/I/61S+unjuJ6L._SS1000_.jpg',
      description:
          "This high-quality bat is built to perform, offering exceptional power and a comfortable feel for players of all abilities. The SS Ton Gladiator is renowned for its excellent balance and large sweet spot, ensuring that every shot you play is impactful. Crafted with precision, this bat will be your trusted companion in every innings.",
      discountPercentage: null,
      quantityAvailable: 31,
    ),

    Product(
      productID: 8,
      productName: 'DSC Krunch 5.0',
      productBrand: 'DSC',
      category: 'Bat',
      price: 98000,
      productImage:
          'https://5.imimg.com/data5/SELLER/Default/2025/1/484063839/KW/RD/SM/181026464/dsc-krunch-5-0-english-willow-cricket-bat.jpg',
      description:
          "Experience the perfect blend of power and affordability with the DSC Krunch 5.0 English Willow cricket bat. This high-quality bat is an excellent option for all players, offering a fantastic pick-up and a wide hitting area that allows for dynamic stroke play. The DSC Krunch 5.0 is designed to deliver consistent performance, helping you to score runs freely and confidently.",
      discountPercentage: null,
      quantityAvailable: 14,
    ),

    Product(
      productID: 9,
      productName: 'New Balance TC 1260',
      productBrand: 'New Balance',
      category: 'Bat',
      price: 132000,
      productImage: 'https://m.media-amazon.com/images/I/41pwCXcyd3L.jpg',
      description:
          "Elevate your game with the New Balance TC 1260 cricket bat, a high-quality option designed for discerning players. This bat offers superb balance and a powerful profile, making it suitable for all levels of cricketers seeking to enhance their performance. The TC 1260 embodies New Balance's commitment to precision and player comfort.",
      discountPercentage: 5,
      quantityAvailable: 20,
    ),

    Product(
      productID: 10,
      productName: "Adidas Pellara XT",
      productBrand: "Adidas",
      category: "Bat",
      price: 119000,
      productImage:
          "https://sportsjam.in/media/catalog/product/cache/f6d88dd4f51ed5a5b4384f0ded062b0d/a/d/adab7088l.jpg",
      description:
          "Step up to the crease with the Adidas Pellara XT cricket bat, a high-quality option built for all players who demand performance. This bat offers a strong profile and excellent pick-up, designed to help you generate maximum power and control with every shot. The Adidas Pellara XT combines innovative design with reliable construction, ensuring a consistent and satisfying batting experience.",
      discountPercentage: null,
      quantityAvailable: 17,
    ),

    Product(
      productID: 11,
      productName: "Spartan MSD 7",
      productBrand: "Spartan",
      category: "Bat",
      price: 108000,
      productImage:
          "https://www.ubuy.com.lk/productimg/?image=aHR0cHM6Ly9pbWFnZXMtbmEuc3NsLWltYWdlcy1hbWF6b24uY29tL2ltYWdlcy9JLzgxJTJCVWMwVG1XUkwuX1NTNDAwXy5qcGc.jpg",
      description:
          "Unleash the spirit of a legend with the Spartan MSD 7 cricket bat. This high-quality bat, inspired by the iconic M.S. Dhoni, is crafted to cater to players of all skill levels. It offers a superb feel, excellent balance, and a responsive hitting area, allowing you to play your shots with confidence and flair. The Spartan MSD 7 is a testament to precision engineering and performance.",
      discountPercentage: null,
      quantityAvailable: 41,
    ),

    Product(
      productID: 12,
      productName: "GM Diamond DXM",
      productBrand: "GM",
      category: "Bat",
      price: 105000,
      productImage:
          "https://www.ubuy.com.lk/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvMzFDRmhjNHIwb0wuX1NTNDAwXy5qcGc.jpg",
      description:
          "Shine on the pitch with the GM Diamond DXM cricket bat. This high-quality bat is designed for players of all standards, offering a harmonious blend of power, feel, and control. The GM Diamond DXM features a well-balanced profile and a substantial sweet spot, allowing for effortless stroke play and boundary-hitting ability. Experience the renowned craftsmanship of GM, a brand trusted by cricketers worldwide.",
      discountPercentage: null,
      quantityAvailable: 40,
    ),
  ];

  static List<Product> cricketBalls = [
    Product(
      productID: 13,
      productName: "CA White Match Ball",
      productBrand: "CA",
      category: "Ball",
      price: 17000,
      productImage:
          "https://img.drz.lazcdn.com/static/lk/p/617d0c439650b98d8d7ed2b40401c181.jpg_720x720q80.jpg",
      description: "High-quality ball for all players.",
      discountPercentage: null,
      quantityAvailable: 37,
    ),

    Product(
      productID: 14,
      productName: "Kookaburra Turf Red",
      productBrand: "Kookaburra",
      category: "Ball",
      price: 60000,
      productImage:
          "https://m.media-amazon.com/images/I/41baBTzvWLL._AC_UF894,1000_QL80_.jpg",
      description:
          "The official ball used in Test matches, made from Australian leather with a four-piece construction, known for its consistent performance",
      discountPercentage: null,
      quantityAvailable: 15,
    ),

    Product(
      productID: 15,
      productName: "SG Test (Red/White)",
      productBrand: "SG",
      category: "Ball",
      price: 15694,
      productImage:
          "https://m.media-amazon.com/images/I/710cq5CxnZL._AC_UF894,1000_QL80_.jpg",
      description:
          "A premium quality leather ball meeting international standards, crafted for durability and consistent performance in professional matches.",
      discountPercentage: null,
      quantityAvailable: 0,
    ),

    Product(
      productID: 16,
      productName: "Dukes Club Match (Red/Pink)",
      productBrand: "Dukes",
      category: "Ball",
      price: 8750,
      productImage:
          "https://www.sportsballshop.co.uk/cdn/shop/products/CadetBoth.jpg?v=1698143052&width=640",
      description:
          "A high-quality four-piece leather ball, popular for club and competitive matches, known for its longevity and ability to swing.",
      discountPercentage: null,
      quantityAvailable: 40,
    ),

    Product(
      productID: 17,
      productName: "SF County Cricket Ball",
      productBrand: "SF",
      category: "Ball",
      price: 2100,
      productImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX-Oh40ix5cg6ZwUrU78EB8-7ClWfCDICmnQ&s",
      description:
          "A durable leather cricket ball suitable for junior and club level matches, offering consistent performance.",
      discountPercentage: null,
      quantityAvailable: 0,
    ),

    Product(
      productID: 18,
      productName: "Cosco Cricket Tennis Ball (Light/Heavy Weight)",
      productBrand: "Cosco",
      category: "Ball",
      price: 1900,
      productImage: "https://m.media-amazon.com/images/I/81nKramKiRL.jpg",
      description:
          "Rubber tennis balls designed for cricket practice, offering different weights for varied training needs, commonly used for casual games.",
      discountPercentage: null,
      quantityAvailable: 120,
    ),

    Product(
      productID: 19,
      productName: "Vicky Leather Cork Cricket Ball (White)",
      productBrand: "Vicky",
      category: "Ball",
      price: 3614,
      productImage:
          "https://vickysports.com/cdn/shop/files/BackRed_197ca9d4-e6c2-4126-84d4-078e5031fe8b.jpg?v=1703849601&width=1214",
      description:
          "Leather and cork ball ideal for intermediate to recreational level matches, offering a good balance of durability and playability.",
      discountPercentage: null,
      quantityAvailable: 60,
    ),

    Product(
      productID: 20,
      productName: "SG Bouncer Leather Ball (Red)",
      productBrand: "SG",
      category: "Ball",
      price: 5472,
      productImage:
          "https://shop.teamsg.in/cdn/shop/files/1_17c95107-a7f4-4054-8739-1d8b39d584a4.png?v=1720243084&width=1946",
      description:
          "A four-piece leather ball designed to perform well on bouncier pitches, offering good seam and bounce.",
      discountPercentage: 5,
      quantityAvailable: 35,
    ),

    Product(
      productID: 21,
      productName: "Readers County Crown Cricket Ball (Red/White/Pink)",
      productBrand: "Readers",
      category: "Ball",
      price: 6750,
      productImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOwXjShVuDvo5Ml_Ktx5DjNsD-dCnBUTtz1A&s",
      description:
          "A popular leather ball used in county and club cricket, known for its traditional feel and consistent seam.",
      discountPercentage: null,
      quantityAvailable: 50,
    ),

    Product(
      productID: 22,
      productName: "Kookaburra Super Test Cricket Ball (Red)",
      productBrand: "Kookaburra",
      category: "Ball",
      price: 8750,
      productImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYbYDAxzAVuwivDaGo515SUsW-55bi9SNtaw&s",
      description:
          "A high-performance leather ball, a step down from the Turf but still offering excellent quality for competitive play.",
      discountPercentage: null,
      quantityAvailable: 20,
    ),

    Product(
      productID: 23,
      productName: "Dukes Allrounder 2 Piece Cricket Ball (Red)",
      productBrand: "Dukes",
      category: "Ball",
      price: 21000,
      productImage:
          "https://www.opalsports.co.za/wp-content/uploads/2024/08/130DUK-AL-1.png",
      description:
          "A 2-piece leather ball suitable for various conditions and levels of play, offering good value for money.",
      discountPercentage: null,
      quantityAvailable: 12,
    ),

    Product(
      productID: 24,
      productName: "FORTRESS Royal Crown Cricket Ball",
      productBrand: "FORTRESS",
      category: "Ball",
      price: 12000,
      productImage:
          "https://i.ebayimg.com/images/g/ZyYAAOSw24FntfRv/s-l1200.jpg",
      description:
          "A 4-piece cowhide leather ball designed for Test, ODI, and T20 matches, aiming for professional-grade performance.",
      discountPercentage: null,
      quantityAvailable: 30,
    ),
  ];

  static List<Product> cricketHelmets = [
    Product(
      productID: 25,
      productName: "Masuri T-Line Titanium Helmet",
      productBrand: "Masuri",
      category: "Helmet",
      price: 125000,
      productImage:
          "https://m.media-amazon.com/images/I/811UTEKZ77L._AC_UF1000,1000_QL80_.jpg",
      description:
          "High-performance, lightweight titanium grille helmet for elite players, meeting top safety standards.",
      discountPercentage: null,
      quantityAvailable: 10,
    ),

    Product(
      productID: 26,
      productName: "Shrey Masterclass Air 2.0 Steel Helmet",
      productBrand: "Shrey",
      category: "Helmet",
      price: 45000,
      productImage:
          "https://kingsgrovesports.com.au/cdn/shop/products/masterclass-air-2.0-titanium-black_400x.jpg?v=1569212722",
      description:
          "A professional-grade helmet with a strong steel grille, known for comfort and advanced airflow.",
      discountPercentage: 5,
      quantityAvailable: 20,
    ),

    Product(
      productID: 27,
      productName: "SG AeroShield 2.0 Helmet",
      productBrand: "SG",
      category: "Helmet",
      price: 20000,
      productImage:
          "https://static.wixstatic.com/media/110dea_80c267e66fac4a6581b347d2f941ffe1~mv2.png/v1/fit/w_500,h_500,q_90/file.png",
      description:
          "Lightweight and robust helmet with a shock-absorbing shell, designed for comfort and protection at various levels.",
      discountPercentage: 10,
      quantityAvailable: 40,
    ),

    Product(
      productID: 28,
      productName: "Gray-Nicolls Ultimate 360 Helmet",
      productBrand: "Gray-Nicolls",
      category: "Helmet",
      price: 32500,
      productImage:
          "https://m.media-amazon.com/images/I/71fhhcvK5ZL._AC_SL1500_.jpg",
      description:
          "Offers comprehensive 360-degree protection with a lightweight design, popular among club and professional players.",
      discountPercentage: null,
      quantityAvailable: 30,
    ),

    Product(
      productID: 29,
      productName: "Kookaburra Pro 600 Helmet",
      productBrand: "Kookaburra",
      category: "Helmet",
      price: 23000,
      productImage:
          "https://www.rebelsport.com.au/dw/image/v2/BBRV_PRD/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dwabcf90a2/images/58031201/Rebel_58031201_green_hi-res.jpg?sw=1000&sh=1000&sm=fit&q=70",
      description:
          "Durable and comfortable helmet suitable for junior to intermediate players, featuring good ventilation and a strong grille.",
      discountPercentage: null,
      quantityAvailable: 50,
    ),

    Product(
      productID: 30,
      productName: "DSC Guard Cricket Helmet",
      productBrand: "DSC",
      category: "Helmet",
      price: 13000,
      productImage:
          "https://img.drz.lazcdn.com/static/lk/p/99c50abe791d6d690e34b07938c7bffa.jpg_720x720q80.jpg",
      description:
          "Entry to mid-level helmet offering reliable protection with a comfortable fit, ideal for club and casual play.",
      discountPercentage: 15,
      quantityAvailable: 70,
    ),

    Product(
      productID: 31,
      productName: "SS Gladiator Helmet",
      productBrand: "SS",
      category: "Helmet",
      price: 16000,
      productImage:
          "https://www.nzcricketstore.com/cdn/shop/products/ss-gladiator-cricket-helmet-556172_1024x1024.jpg?v=1640876406",
      description:
          "Sturdy helmet from a well-known Indian productBrand, providing strong impact resistance for competitive cricket.",
      discountPercentage: null,
      quantityAvailable: 59,
    ),

    Product(
      productID: 32,
      productName: "Masuri C-Line Plus Steel Helmet",
      productBrand: "Masuri",
      category: "Helmet",
      price: 55000,
      productImage:
          "https://cricketshop.eu/cdn/shop/files/C-LINEPLUSSTEELCRICKETHELMET_4.jpg?v=1721902692",
      description:
          "A popular steel grille helmet from Masuri, offering excellent protection and comfort for senior club cricketers.",
      discountPercentage: null,
      quantityAvailable: 25,
    ),

    Product(
      productID: 33,
      productName: "Shrey Performance Steel Helmet",
      productBrand: "Shrey",
      category: "Helmet",
      price: 34000,
      productImage:
          "https://m.media-amazon.com/images/I/61V8u383EIL._SS1000_.jpg",
      description:
          "A widely used helmet known for its balanced protection, comfort, and value, suitable for various levels of play.",
      discountPercentage: null,
      quantityAvailable: 35,
    ),

    Product(
      productID: 34,
      productName: "Gunn & Moore (GM) Purist Geo II Helmet",
      productBrand: "Gunn & Moore",
      category: "Helmet",
      price: 28500,
      productImage:
          "https://images-na.ssl-images-amazon.com/images/I/41eaouK6WuL.jpg",
      description:
          "Features an improved peak strength and precisely fitted grille, reducing ball penetration risk.",
      discountPercentage: 10,
      quantityAvailable: 45,
    ),

    Product(
      productID: 35,
      productName: "Albion Test Helmet",
      productBrand: "Albion",
      category: "Helmet",
      price: 23000,
      productImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzXBQjLdMDKoZJwczaojk3cagUxRVCzK6kmg&s",
      description:
          "A traditional-style helmet favored by many for its classic feel and solid protection.",
      discountPercentage: null,
      quantityAvailable: 55,
    ),

    Product(
      productID: 36,
      productName: "Moonwalkr Mind 2.0 Helmet",
      productBrand: "Moonwalkr",
      category: "Helmet",
      price: 36500,
      productImage:
          "https://www.ubuy.com.lk/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjFLTVRoc0owV0wuX1NTNDAwXy5qcGc.jpg",
      description:
          "Modern design with emphasis on lightweight and advanced protection, often used by professional players.",
      discountPercentage: 5,
      quantityAvailable: 20,
    ),
  ];

  static List<Product> otherEquipment = [
    Product(
      productID: 37,
      productName: "SG Super Test Wicket Keeping Gloves",
      productBrand: "SG",
      category: "Other",
      price: 28000,
      productImage:
          "https://www.nzcricketstore.com/cdn/shop/products/sg-test-wicket-keeping-gloves-203569_1024x1024.webp?v=1659824396",
      description:
          "Premium quality wicket keeping gloves designed for professional use, offering excellent grip and protection.",
      discountPercentage: 8,
      quantityAvailable: 20,
    ),

    Product(
      productID: 38,
      productName: "GM Mythos 606 Batting Gloves",
      productBrand: "Gunn & Moore",
      category: "Other",
      price: 15000,
      productImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9Hju_OAAEontFFWxrTgn-9xQ_hFPi3WvVDw&s",
      description:
          "Comfortable and protective batting gloves with good airflow, suitable for club and intermediate players.",
      discountPercentage: null,
      quantityAvailable: 45,
    ),

    Product(
      productID: 39,
      productName: "SS County Batting Gloves",
      productBrand: "SS",
      category: "Other",
      price: 12000,
      productImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRIvjy2Ka_nNTbLIRJsyzOd3wsktmZe9xySA&s",
      description:
          "Durable batting gloves offering solid protection and a good feel for the bat, popular among club cricketers.",
      discountPercentage: 10,
      quantityAvailable: 50,
    ),

    Product(
      productID: 40,
      productName: "Kookaburra Kahuna Lite Batting Gloves",
      productBrand: "Kookaburra",
      category: "Other",
      price: 18000,
      productImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzrrL69D8pS9gSmWDHg32nwVjKPqQLe66Hog&s",
      description:
          "Lightweight batting gloves designed for agility and comfort, providing reliable protection for competitive play.",
      discountPercentage: null,
      quantityAvailable: 35,
    ),

    Product(
      productID: 41,
      productName: "Adidas 22 YDS Boost Shoes",
      productBrand: "Adidas",
      category: "Other",
      price: 35000,
      productImage:
          "https://www.allroundercricket.com/us/media/catalog/product/cache/16882fc9de905805ba934b71051d18ad/a/d/adidas_1__1.png",
      description:
          "High-performance cricket shoes with Boost cushioning for superior energy return and comfort, ideal for all-rounders.",
      discountPercentage: null,
      quantityAvailable: 25,
    ),

    Product(
      productID: 42,
      productName: "New Balance CK4040 L4 Spikes",
      productBrand: "New Balance",
      category: "Other",
      price: 28000,
      productImage:
          "https://www.allroundercricket.com/us/media/catalog/product/cache/16882fc9de905805ba934b71051d18ad/c/k/ck4040l4.jpg",
      description:
          "Bowling spikes designed for stability and durability, providing excellent traction on the pitch.",
      discountPercentage: 7,
      quantityAvailable: 30,
    ),

    Product(
      productID: 43,
      productName: "Asics Gel-Peake 8 Cricket Shoes",
      productBrand: "Asics",
      category: "Other",
      price: 22000,
      productImage:
          "https://www.ubuy.com.lk/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNTFlTWUxQVVUR0wuX1NTNDAwXy5qcGc.jpg",
      description:
          "All-round cricket shoes featuring GEL cushioning for shock absorption and comfort during long hours of play.",
      discountPercentage: null,
      quantityAvailable: 40,
    ),

    Product(
      productID: 44,
      productName: "Puma 22 FH Rubber Cricket Shoes",
      productBrand: "Puma",
      category: "Other",
      price: 16000,
      productImage:
          "https://m.media-amazon.com/images/I/6108Stkyn-L._SS1000_.jpg",
      description:
          "Versatile rubber sole cricket shoes suitable for hard wickets and nets practice, offering good grip.",
      discountPercentage: null,
      quantityAvailable: 55,
    ),

    Product(
      productID: 45,
      productName: "Gunn & Moore Original Duffle Bag",
      productBrand: "Gunn & Moore",
      category: "Other",
      price: 19000,
      productImage:
          "https://otagosportsdepot.co.nz/cdn/shop/files/unproductNamed---2024-09-18T135614-452_800x.jpg?v=1726624819",
      description:
          "Compact and functional duffle bag with ample space for essential cricket gear, easy to carry.",
      discountPercentage: null,
      quantityAvailable: 30,
    ),

    Product(
      productID: 46,
      productName: "SG Campus Wheelie Bag",
      productBrand: "SG",
      category: "Other",
      price: 25000,
      productImage:
          "https://shop.teamsg.in/cdn/shop/files/1_c5c8ba36-8bc6-4707-bb80-f0e3682341d1.png?v=1720164673",
      description:
          "Medium-sized wheelie bag with durable construction, providing convenient transport for all your cricket equipment.",
      discountPercentage: 12,
      quantityAvailable: 20,
    ),

    Product(
      productID: 47,
      productName: "Kookaburra Pro Players Wheelie Bag",
      productBrand: "Kookaburra",
      category: "Other",
      price: 38000,
      productImage:
          "https://commercebuild-175c7.kxcdn.com/cdn-d03d5231-5b2e278c.commercebuild.com/cf738e9579802e6b988bb225ca6bc00c/contents/3S251101/thumbnail/middle_3S251101-Players-Wheelie-Front.jpg?quality=65",
      description:
          "Large professional-grade wheelie bag with multiple compartments, designed to hold a full kit for serious cricketers.",
      discountPercentage: null,
      quantityAvailable: 15,
    ),

    Product(
      productID: 48,
      productName: "DSC Big Bash Kit Bag",
      productBrand: "DSC",
      category: "Other",
      price: 14000,
      productImage:
          "https://cricketcentre.com.au/cdn/shop/files/GBD24C4.jpg?v=1726728889",
      description:
          "Value-for-money kit bag with good capacity, ideal for junior or club players needing to transport their gear.",
      discountPercentage: null,
      quantityAvailable: 45,
    ),
  ];
}
