//
//  GetTests.swift
//  BrightFreddy
//
//  Created by Robbie Plankenhorn on 3/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import BrightFreddy
@testable import BrightFutures
@testable import Freddy

class GetTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetJSONObject1() {
        let expectation = expectationWithDescription("testGetJSONObject1")
        
        Service.getJSONObject("http://jsonplaceholder.typicode.com/posts/1").onSuccess { json in
            print("Success")
        }.onFailure { error in
            XCTFail(error.description)
        }.onCompleteFulfill(expectation)
        
        waitForExpectationsWithTimeoutAndPrint(15)
    }
    
    func testGetObject1() {
        let expectation = expectationWithDescription("testGetObject1")
        
        let responseObject = Post(title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", userId: 1, id: 1, body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
        
        Service.getObject(Post.self, path: "http://jsonplaceholder.typicode.com/posts/1").onSuccess { object in
            XCTAssert(responseObject == object)
        }.onFailure { error in
            XCTFail(error.description)
        }.onCompleteFulfill(expectation)
        
        waitForExpectationsWithTimeoutAndPrint(15)
    }
    
    func testGetObjects1() {
        let expectation = expectationWithDescription("testGetObjects1")
        
        let expectedObjects = [Post(title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", userId: 1, id: 1, body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),Post(title: "qui est esse", userId: 1, id: 2, body: "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"),Post(title: "ea molestias quasi exercitationem repellat qui ipsa sit aut", userId: 1, id: 3, body: "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"),Post(title: "eum et est occaecati", userId: 1, id: 4, body: "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit"),Post(title: "nesciunt quas odio", userId: 1, id: 5, body: "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque"),Post(title: "dolorem eum magni eos aperiam quia", userId: 1, id: 6, body: "ut aspernatur corporis harum nihil quis provident sequi\nmollitia nobis aliquid molestiae\nperspiciatis et ea nemo ab reprehenderit accusantium quas\nvoluptate dolores velit et doloremque molestiae"),Post(title: "magnam facilis autem", userId: 1, id: 7, body: "dolore placeat quibusdam ea quo vitae\nmagni quis enim qui quis quo nemo aut saepe\nquidem repellat excepturi ut quia\nsunt ut sequi eos ea sed quas"),Post(title: "dolorem dolore est ipsam", userId: 1, id: 8, body: "dignissimos aperiam dolorem qui eum\nfacilis quibusdam animi sint suscipit qui sint possimus cum\nquaerat magni maiores excepturi\nipsam ut commodi dolor voluptatum modi aut vitae"),Post(title: "nesciunt iure omnis dolorem tempora et accusantium", userId: 1, id: 9, body: "consectetur animi nesciunt iure dolore\nenim quia ad\nveniam autem ut quam aut nobis\net est aut quod aut provident voluptas autem voluptas"),Post(title: "optio molestias id quia eum", userId: 1, id: 10, body: "quo et expedita modi cum officia vel magni\ndoloribus qui repudiandae\nvero nisi sit\nquos veniam quod sed accusamus veritatis error"),Post(title: "et ea vero quia laudantium autem", userId: 2, id: 11, body: "delectus reiciendis molestiae occaecati non minima eveniet qui voluptatibus\naccusamus in eum beatae sit\nvel qui neque voluptates ut commodi qui incidunt\nut animi commodi"),Post(title: "in quibusdam tempore odit est dolorem", userId: 2, id: 12, body: "itaque id aut magnam\npraesentium quia et ea odit et ea voluptas et\nsapiente quia nihil amet occaecati quia id voluptatem\nincidunt ea est distinctio odio"),Post(title: "dolorum ut in voluptas mollitia et saepe quo animi", userId: 2, id: 13, body: "aut dicta possimus sint mollitia voluptas commodi quo doloremque\niste corrupti reiciendis voluptatem eius rerum\nsit cumque quod eligendi laborum minima\nperferendis recusandae assumenda consectetur porro architecto ipsum ipsam"),Post(title: "voluptatem eligendi optio", userId: 2, id: 14, body: "fuga et accusamus dolorum perferendis illo voluptas\nnon doloremque neque facere\nad qui dolorum molestiae beatae\nsed aut voluptas totam sit illum"),Post(title: "eveniet quod temporibus", userId: 2, id: 15, body: "reprehenderit quos placeat\nvelit minima officia dolores impedit repudiandae molestiae nam\nvoluptas recusandae quis delectus\nofficiis harum fugiat vitae"),Post(title: "sint suscipit perspiciatis velit dolorum rerum ipsa laboriosam odio", userId: 2, id: 16, body: "suscipit nam nisi quo aperiam aut\nasperiores eos fugit maiores voluptatibus quia\nvoluptatem quis ullam qui in alias quia est\nconsequatur magni mollitia accusamus ea nisi voluptate dicta"),Post(title: "fugit voluptas sed molestias voluptatem provident", userId: 2, id: 17, body: "eos voluptas et aut odit natus earum\naspernatur fuga molestiae ullam\ndeserunt ratione qui eos\nqui nihil ratione nemo velit ut aut id quo"),Post(title: "voluptate et itaque vero tempora molestiae", userId: 2, id: 18, body: "eveniet quo quis\nlaborum totam consequatur non dolor\nut et est repudiandae\nest voluptatem vel debitis et magnam"),Post(title: "adipisci placeat illum aut reiciendis qui", userId: 2, id: 19, body: "illum quis cupiditate provident sit magnam\nea sed aut omnis\nveniam maiores ullam consequatur atque\nadipisci quo iste expedita sit quos voluptas"),Post(title: "doloribus ad provident suscipit at", userId: 2, id: 20, body: "qui consequuntur ducimus possimus quisquam amet similique\nsuscipit porro ipsam amet\neos veritatis officiis exercitationem vel fugit aut necessitatibus totam\nomnis rerum consequatur expedita quidem cumque explicabo"),Post(title: "asperiores ea ipsam voluptatibus modi minima quia sint", userId: 3, id: 21, body: "repellat aliquid praesentium dolorem quo\nsed totam minus non itaque\nnihil labore molestiae sunt dolor eveniet hic recusandae veniam\ntempora et tenetur expedita sunt"),Post(title: "dolor sint quo a velit explicabo quia nam", userId: 3, id: 22, body: "eos qui et ipsum ipsam suscipit aut\nsed omnis non odio\nexpedita earum mollitia molestiae aut atque rem suscipit\nnam impedit esse"),Post(title: "maxime id vitae nihil numquam", userId: 3, id: 23, body: "veritatis unde neque eligendi\nquae quod architecto quo neque vitae\nest illo sit tempora doloremque fugit quod\net et vel beatae sequi ullam sed tenetur perspiciatis"),Post(title: "autem hic labore sunt dolores incidunt", userId: 3, id: 24, body: "enim et ex nulla\nomnis voluptas quia qui\nvoluptatem consequatur numquam aliquam sunt\ntotam recusandae id dignissimos aut sed asperiores deserunt"),Post(title: "rem alias distinctio quo quis", userId: 3, id: 25, body: "ullam consequatur ut\nomnis quis sit vel consequuntur\nipsa eligendi ipsum molestiae et omnis error nostrum\nmolestiae illo tempore quia et distinctio"),Post(title: "est et quae odit qui non", userId: 3, id: 26, body: "similique esse doloribus nihil accusamus\nomnis dolorem fuga consequuntur reprehenderit fugit recusandae temporibus\nperspiciatis cum ut laudantium\nomnis aut molestiae vel vero"),Post(title: "quasi id et eos tenetur aut quo autem", userId: 3, id: 27, body: "eum sed dolores ipsam sint possimus debitis occaecati\ndebitis qui qui et\nut placeat enim earum aut odit facilis\nconsequatur suscipit necessitatibus rerum sed inventore temporibus consequatur"),Post(title: "delectus ullam et corporis nulla voluptas sequi", userId: 3, id: 28, body: "non et quaerat ex quae ad maiores\nmaiores recusandae totam aut blanditiis mollitia quas illo\nut voluptatibus voluptatem\nsimilique nostrum eum"),Post(title: "iusto eius quod necessitatibus culpa ea", userId: 3, id: 29, body: "odit magnam ut saepe sed non qui\ntempora atque nihil\naccusamus illum doloribus illo dolor\neligendi repudiandae odit magni similique sed cum maiores"),Post(title: "a quo magni similique perferendis", userId: 3, id: 30, body: "alias dolor cumque\nimpedit blanditiis non eveniet odio maxime\nblanditiis amet eius quis tempora quia autem rem\na provident perspiciatis quia"),Post(title: "ullam ut quidem id aut vel consequuntur", userId: 4, id: 31, body: "debitis eius sed quibusdam non quis consectetur vitae\nimpedit ut qui consequatur sed aut in\nquidem sit nostrum et maiores adipisci atque\nquaerat voluptatem adipisci repudiandae"),Post(title: "doloremque illum aliquid sunt", userId: 4, id: 32, body: "deserunt eos nobis asperiores et hic\nest debitis repellat molestiae optio\nnihil ratione ut eos beatae quibusdam distinctio maiores\nearum voluptates et aut adipisci ea maiores voluptas maxime"),Post(title: "qui explicabo molestiae dolorem", userId: 4, id: 33, body: "rerum ut et numquam laborum odit est sit\nid qui sint in\nquasi tenetur tempore aperiam et quaerat qui in\nrerum officiis sequi cumque quod"),Post(title: "magnam ut rerum iure", userId: 4, id: 34, body: "ea velit perferendis earum ut voluptatem voluptate itaque iusto\ntotam pariatur in\nnemo voluptatem voluptatem autem magni tempora minima in\nest distinctio qui assumenda accusamus dignissimos officia nesciunt nobis"),Post(title: "id nihil consequatur molestias animi provident", userId: 4, id: 35, body: "nisi error delectus possimus ut eligendi vitae\nplaceat eos harum cupiditate facilis reprehenderit voluptatem beatae\nmodi ducimus quo illum voluptas eligendi\net nobis quia fugit"),Post(title: "fuga nam accusamus voluptas reiciendis itaque", userId: 4, id: 36, body: "ad mollitia et omnis minus architecto odit\nvoluptas doloremque maxime aut non ipsa qui alias veniam\nblanditiis culpa aut quia nihil cumque facere et occaecati\nqui aspernatur quia eaque ut aperiam inventore"),Post(title: "provident vel ut sit ratione est", userId: 4, id: 37, body: "debitis et eaque non officia sed nesciunt pariatur vel\nvoluptatem iste vero et ea\nnumquam aut expedita ipsum nulla in\nvoluptates omnis consequatur aut enim officiis in quam qui"),Post(title: "explicabo et eos deleniti nostrum ab id repellendus", userId: 4, id: 38, body: "animi esse sit aut sit nesciunt assumenda eum voluptas\nquia voluptatibus provident quia necessitatibus ea\nrerum repudiandae quia voluptatem delectus fugit aut id quia\nratione optio eos iusto veniam iure"),Post(title: "eos dolorem iste accusantium est eaque quam", userId: 4, id: 39, body: "corporis rerum ducimus vel eum accusantium\nmaxime aspernatur a porro possimus iste omnis\nest in deleniti asperiores fuga aut\nvoluptas sapiente vel dolore minus voluptatem incidunt ex"),Post(title: "enim quo cumque", userId: 4, id: 40, body: "ut voluptatum aliquid illo tenetur nemo sequi quo facilis\nipsum rem optio mollitia quas\nvoluptatem eum voluptas qui\nunde omnis voluptatem iure quasi maxime voluptas nam"),Post(title: "non est facere", userId: 5, id: 41, body: "molestias id nostrum\nexcepturi molestiae dolore omnis repellendus quaerat saepe\nconsectetur iste quaerat tenetur asperiores accusamus ex ut\nnam quidem est ducimus sunt debitis saepe"),Post(title: "commodi ullam sint et excepturi error explicabo praesentium voluptas", userId: 5, id: 42, body: "odio fugit voluptatum ducimus earum autem est incidunt voluptatem\nodit reiciendis aliquam sunt sequi nulla dolorem\nnon facere repellendus voluptates quia\nratione harum vitae ut"),Post(title: "eligendi iste nostrum consequuntur adipisci praesentium sit beatae perferendis", userId: 5, id: 43, body: "similique fugit est\nillum et dolorum harum et voluptate eaque quidem\nexercitationem quos nam commodi possimus cum odio nihil nulla\ndolorum exercitationem magnam ex et a et distinctio debitis"),Post(title: "optio dolor molestias sit", userId: 5, id: 44, body: "temporibus est consectetur dolore\net libero debitis vel velit laboriosam quia\nipsum quibusdam qui itaque fuga rem aut\nea et iure quam sed maxime ut distinctio quae"),Post(title: "ut numquam possimus omnis eius suscipit laudantium iure", userId: 5, id: 45, body: "est natus reiciendis nihil possimus aut provident\nex et dolor\nrepellat pariatur est\nnobis rerum repellendus dolorem autem"),Post(title: "aut quo modi neque nostrum ducimus", userId: 5, id: 46, body: "voluptatem quisquam iste\nvoluptatibus natus officiis facilis dolorem\nquis quas ipsam\nvel et voluptatum in aliquid"),Post(title: "quibusdam cumque rem aut deserunt", userId: 5, id: 47, body: "voluptatem assumenda ut qui ut cupiditate aut impedit veniam\noccaecati nemo illum voluptatem laudantium\nmolestiae beatae rerum ea iure soluta nostrum\neligendi et voluptate"),Post(title: "ut voluptatem illum ea doloribus itaque eos", userId: 5, id: 48, body: "voluptates quo voluptatem facilis iure occaecati\nvel assumenda rerum officia et\nillum perspiciatis ab deleniti\nlaudantium repellat ad ut et autem reprehenderit"),Post(title: "laborum non sunt aut ut assumenda perspiciatis voluptas", userId: 5, id: 49, body: "inventore ab sint\nnatus fugit id nulla sequi architecto nihil quaerat\neos tenetur in in eum veritatis non\nquibusdam officiis aspernatur cumque aut commodi aut"),Post(title: "repellendus qui recusandae incidunt voluptates tenetur qui omnis exercitationem", userId: 5, id: 50, body: "error suscipit maxime adipisci consequuntur recusandae\nvoluptas eligendi et est et voluptates\nquia distinctio ab amet quaerat molestiae et vitae\nadipisci impedit sequi nesciunt quis consectetur"),Post(title: "soluta aliquam aperiam consequatur illo quis voluptas", userId: 6, id: 51, body: "sunt dolores aut doloribus\ndolore doloribus voluptates tempora et\ndoloremque et quo\ncum asperiores sit consectetur dolorem"),Post(title: "qui enim et consequuntur quia animi quis voluptate quibusdam", userId: 6, id: 52, body: "iusto est quibusdam fuga quas quaerat molestias\na enim ut sit accusamus enim\ntemporibus iusto accusantium provident architecto\nsoluta esse reprehenderit qui laborum"),Post(title: "ut quo aut ducimus alias", userId: 6, id: 53, body: "minima harum praesentium eum rerum illo dolore\nquasi exercitationem rerum nam\nporro quis neque quo\nconsequatur minus dolor quidem veritatis sunt non explicabo similique"),Post(title: "sit asperiores ipsam eveniet odio non quia", userId: 6, id: 54, body: "totam corporis dignissimos\nvitae dolorem ut occaecati accusamus\nex velit deserunt\net exercitationem vero incidunt corrupti mollitia"),Post(title: "sit vel voluptatem et non libero", userId: 6, id: 55, body: "debitis excepturi ea perferendis harum libero optio\neos accusamus cum fuga ut sapiente repudiandae\net ut incidunt omnis molestiae\nnihil ut eum odit"),Post(title: "qui et at rerum necessitatibus", userId: 6, id: 56, body: "aut est omnis dolores\nneque rerum quod ea rerum velit pariatur beatae excepturi\net provident voluptas corrupti\ncorporis harum reprehenderit dolores eligendi"),Post(title: "sed ab est est", userId: 6, id: 57, body: "at pariatur consequuntur earum quidem\nquo est laudantium soluta voluptatem\nqui ullam et est\net cum voluptas voluptatum repellat est"),Post(title: "voluptatum itaque dolores nisi et quasi", userId: 6, id: 58, body: "veniam voluptatum quae adipisci id\net id quia eos ad et dolorem\naliquam quo nisi sunt eos impedit error\nad similique veniam"),Post(title: "qui commodi dolor at maiores et quis id accusantium", userId: 6, id: 59, body: "perspiciatis et quam ea autem temporibus non voluptatibus qui\nbeatae a earum officia nesciunt dolores suscipit voluptas et\nanimi doloribus cum rerum quas et magni\net hic ut ut commodi expedita sunt"),Post(title: "consequatur placeat omnis quisquam quia reprehenderit fugit veritatis facere", userId: 6, id: 60, body: "asperiores sunt ab assumenda cumque modi velit\nqui esse omnis\nvoluptate et fuga perferendis voluptas\nillo ratione amet aut et omnis"),Post(title: "voluptatem doloribus consectetur est ut ducimus", userId: 7, id: 61, body: "ab nemo optio odio\ndelectus tenetur corporis similique nobis repellendus rerum omnis facilis\nvero blanditiis debitis in nesciunt doloribus dicta dolores\nmagnam minus velit"),Post(title: "beatae enim quia vel", userId: 7, id: 62, body: "enim aspernatur illo distinctio quae praesentium\nbeatae alias amet delectus qui voluptate distinctio\nodit sint accusantium autem omnis\nquo molestiae omnis ea eveniet optio"),Post(title: "voluptas blanditiis repellendus animi ducimus error sapiente et suscipit", userId: 7, id: 63, body: "enim adipisci aspernatur nemo\nnumquam omnis facere dolorem dolor ex quis temporibus incidunt\nab delectus culpa quo reprehenderit blanditiis asperiores\naccusantium ut quam in voluptatibus voluptas ipsam dicta"),Post(title: "et fugit quas eum in in aperiam quod", userId: 7, id: 64, body: "id velit blanditiis\neum ea voluptatem\nmolestiae sint occaecati est eos perspiciatis\nincidunt a error provident eaque aut aut qui"),Post(title: "consequatur id enim sunt et et", userId: 7, id: 65, body: "voluptatibus ex esse\nsint explicabo est aliquid cumque adipisci fuga repellat labore\nmolestiae corrupti ex saepe at asperiores et perferendis\nnatus id esse incidunt pariatur"),Post(title: "repudiandae ea animi iusto", userId: 7, id: 66, body: "officia veritatis tenetur vero qui itaque\nsint non ratione\nsed et ut asperiores iusto eos molestiae nostrum\nveritatis quibusdam et nemo iusto saepe"),Post(title: "aliquid eos sed fuga est maxime repellendus", userId: 7, id: 67, body: "reprehenderit id nostrum\nvoluptas doloremque pariatur sint et accusantium quia quod aspernatur\net fugiat amet\nnon sapiente et consequatur necessitatibus molestiae"),Post(title: "odio quis facere architecto reiciendis optio", userId: 7, id: 68, body: "magnam molestiae perferendis quisquam\nqui cum reiciendis\nquaerat animi amet hic inventore\nea quia deleniti quidem saepe porro velit"),Post(title: "fugiat quod pariatur odit minima", userId: 7, id: 69, body: "officiis error culpa consequatur modi asperiores et\ndolorum assumenda voluptas et vel qui aut vel rerum\nvoluptatum quisquam perspiciatis quia rerum consequatur totam quas\nsequi commodi repudiandae asperiores et saepe a"),Post(title: "voluptatem laborum magni", userId: 7, id: 70, body: "sunt repellendus quae\nest asperiores aut deleniti esse accusamus repellendus quia aut\nquia dolorem unde\neum tempora esse dolore"),Post(title: "et iusto veniam et illum aut fuga", userId: 8, id: 71, body: "occaecati a doloribus\niste saepe consectetur placeat eum voluptate dolorem et\nqui quo quia voluptas\nrerum ut id enim velit est perferendis"),Post(title: "sint hic doloribus consequatur eos non id", userId: 8, id: 72, body: "quam occaecati qui deleniti consectetur\nconsequatur aut facere quas exercitationem aliquam hic voluptas\nneque id sunt ut aut accusamus\nsunt consectetur expedita inventore velit"),Post(title: "consequuntur deleniti eos quia temporibus ab aliquid at", userId: 8, id: 73, body: "voluptatem cumque tenetur consequatur expedita ipsum nemo quia explicabo\naut eum minima consequatur\ntempore cumque quae est et\net in consequuntur voluptatem voluptates aut"),Post(title: "enim unde ratione doloribus quas enim ut sit sapiente", userId: 8, id: 74, body: "odit qui et et necessitatibus sint veniam\nmollitia amet doloremque molestiae commodi similique magnam et quam\nblanditiis est itaque\nquo et tenetur ratione occaecati molestiae tempora"),Post(title: "dignissimos eum dolor ut enim et delectus in", userId: 8, id: 75, body: "commodi non non omnis et voluptas sit\nautem aut nobis magnam et sapiente voluptatem\net laborum repellat qui delectus facilis temporibus\nrerum amet et nemo voluptate expedita adipisci error dolorem"),Post(title: "doloremque officiis ad et non perferendis", userId: 8, id: 76, body: "ut animi facere\ntotam iusto tempore\nmolestiae eum aut et dolorem aperiam\nquaerat recusandae totam odio"),Post(title: "necessitatibus quasi exercitationem odio", userId: 8, id: 77, body: "modi ut in nulla repudiandae dolorum nostrum eos\naut consequatur omnis\nut incidunt est omnis iste et quam\nvoluptates sapiente aliquam asperiores nobis amet corrupti repudiandae provident"),Post(title: "quam voluptatibus rerum veritatis", userId: 8, id: 78, body: "nobis facilis odit tempore cupiditate quia\nassumenda doloribus rerum qui ea\nillum et qui totam\naut veniam repellendus"),Post(title: "pariatur consequatur quia magnam autem omnis non amet", userId: 8, id: 79, body: "libero accusantium et et facere incidunt sit dolorem\nnon excepturi qui quia sed laudantium\nquisquam molestiae ducimus est\nofficiis esse molestiae iste et quos"),Post(title: "labore in ex et explicabo corporis aut quas", userId: 8, id: 80, body: "ex quod dolorem ea eum iure qui provident amet\nquia qui facere excepturi et repudiandae\nasperiores molestias provident\nminus incidunt vero fugit rerum sint sunt excepturi provident"),Post(title: "tempora rem veritatis voluptas quo dolores vero", userId: 9, id: 81, body: "facere qui nesciunt est voluptatum voluptatem nisi\nsequi eligendi necessitatibus ea at rerum itaque\nharum non ratione velit laboriosam quis consequuntur\nex officiis minima doloremque voluptas ut aut"),Post(title: "laudantium voluptate suscipit sunt enim enim", userId: 9, id: 82, body: "ut libero sit aut totam inventore sunt\nporro sint qui sunt molestiae\nconsequatur cupiditate qui iste ducimus adipisci\ndolor enim assumenda soluta laboriosam amet iste delectus hic"),Post(title: "odit et voluptates doloribus alias odio et", userId: 9, id: 83, body: "est molestiae facilis quis tempora numquam nihil qui\nvoluptate sapiente consequatur est qui\nnecessitatibus autem aut ipsa aperiam modi dolore numquam\nreprehenderit eius rem quibusdam"),Post(title: "optio ipsam molestias necessitatibus occaecati facilis veritatis dolores aut", userId: 9, id: 84, body: "sint molestiae magni a et quos\neaque et quasi\nut rerum debitis similique veniam\nrecusandae dignissimos dolor incidunt consequatur odio"),Post(title: "dolore veritatis porro provident adipisci blanditiis et sunt", userId: 9, id: 85, body: "similique sed nisi voluptas iusto omnis\nmollitia et quo\nassumenda suscipit officia magnam sint sed tempora\nenim provident pariatur praesentium atque animi amet ratione"),Post(title: "placeat quia et porro iste", userId: 9, id: 86, body: "quasi excepturi consequatur iste autem temporibus sed molestiae beatae\net quaerat et esse ut\nvoluptatem occaecati et vel explicabo autem\nasperiores pariatur deserunt optio"),Post(title: "nostrum quis quasi placeat", userId: 9, id: 87, body: "eos et molestiae\nnesciunt ut a\ndolores perspiciatis repellendus repellat aliquid\nmagnam sint rem ipsum est"),Post(title: "sapiente omnis fugit eos", userId: 9, id: 88, body: "consequatur omnis est praesentium\nducimus non iste\nneque hic deserunt\nvoluptatibus veniam cum et rerum sed"),Post(title: "sint soluta et vel magnam aut ut sed qui", userId: 9, id: 89, body: "repellat aut aperiam totam temporibus autem et\narchitecto magnam ut\nconsequatur qui cupiditate rerum quia soluta dignissimos nihil iure\ntempore quas est"),Post(title: "ad iusto omnis odit dolor voluptatibus", userId: 9, id: 90, body: "minus omnis soluta quia\nqui sed adipisci voluptates illum ipsam voluptatem\neligendi officia ut in\neos soluta similique molestias praesentium blanditiis"),Post(title: "aut amet sed", userId: 10, id: 91, body: "libero voluptate eveniet aperiam sed\nsunt placeat suscipit molestias\nsimilique fugit nam natus\nexpedita consequatur consequatur dolores quia eos et placeat"),Post(title: "ratione ex tenetur perferendis", userId: 10, id: 92, body: "aut et excepturi dicta laudantium sint rerum nihil\nlaudantium et at\na neque minima officia et similique libero et\ncommodi voluptate qui"),Post(title: "beatae soluta recusandae", userId: 10, id: 93, body: "dolorem quibusdam ducimus consequuntur dicta aut quo laboriosam\nvoluptatem quis enim recusandae ut sed sunt\nnostrum est odit totam\nsit error sed sunt eveniet provident qui nulla"),Post(title: "qui qui voluptates illo iste minima", userId: 10, id: 94, body: "aspernatur expedita soluta quo ab ut similique\nexpedita dolores amet\nsed temporibus distinctio magnam saepe deleniti\nomnis facilis nam ipsum natus sint similique omnis"),Post(title: "id minus libero illum nam ad officiis", userId: 10, id: 95, body: "earum voluptatem facere provident blanditiis velit laboriosam\npariatur accusamus odio saepe\ncumque dolor qui a dicta ab doloribus consequatur omnis\ncorporis cupiditate eaque assumenda ad nesciunt"),Post(title: "quaerat velit veniam amet cupiditate aut numquam ut sequi", userId: 10, id: 96, body: "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut"),Post(title: "quas fugiat ut perspiciatis vero provident", userId: 10, id: 97, body: "eum non blanditiis soluta porro quibusdam voluptas\nvel voluptatem qui placeat dolores qui velit aut\nvel inventore aut cumque culpa explicabo aliquid at\nperspiciatis est et voluptatem dignissimos dolor itaque sit nam"),Post(title: "laboriosam dolor voluptates", userId: 10, id: 98, body: "doloremque ex facilis sit sint culpa\nsoluta assumenda eligendi non ut eius\nsequi ducimus vel quasi\nveritatis est dolores"),Post(title: "temporibus sit alias delectus eligendi possimus magni", userId: 10, id: 99, body: "quo deleniti praesentium dicta non quod\naut est molestias\nmolestias et officia quis nihil\nitaque dolorem quia"),Post(title: "at nam consequatur ea labore ea harum", userId: 10, id: 100, body: "cupiditate quo est a modi nesciunt soluta\nipsa voluptas error itaque dicta in\nautem qui minus magnam et distinctio eum\naccusamus ratione error aut")]

        Service.getObjects(Post.self, path: "http://jsonplaceholder.typicode.com/posts").onSuccess { objects in
            XCTAssert(expectedObjects == objects)
        }.onFailure { error in
            XCTFail(error.description)
        }.onCompleteFulfill(expectation)
        
        waitForExpectationsWithTimeoutAndPrint(15)
    }
}

struct Post {
    var title:String
    var userId:Int
    var id:Int
    var body:String
}

extension Post: JSONDecodable {
    init(json: JSON) throws {
        title = try json.string("title")
        userId = try json.int("userId")
        id = try json.int("id")
        body = try json.string("body")
    }
}

extension Post: Equatable {
    
}

func ==(lhs: Post, rhs: Post) -> Bool {
    return lhs.title == rhs.title && lhs.userId == rhs.userId && lhs.id == rhs.id && lhs.body == rhs.body
}

