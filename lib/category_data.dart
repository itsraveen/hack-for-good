import 'package:hackforgood/models/family.dart';
// import 'package:hackforgood/models/chat_message.dart';

import 'models/projects.dart';
import 'models/users.dart';

const FAMILY_CATEGORIES = [
  Family(
      name: 'Siti Sara',
      image: 'assets/images/famMain.jpg',
      gallery: [
        'assets/images/fam1.jpg',
        'assets/images/fam2.jpg',
        'assets/images/fam3.jpg',
      ],
      description:
          "Homeowner in Batam. When Habitat Singapore visited her in 2017, she had moved into her new Habitat house and started her own home business.",
      organisation: "Habitat for Humanity Singapore",
      noOfPax: 5,
      noOfRooms: 4,
      householdIncome: 1000.0,
      messages: [])
];

var PROJECTS_CATEGORIES = [
  Projects(
    name: 'Batam Build',
    image: 'assets/images/batamBuild.jpg',
    gallery: [
      'assets/images/batamBuild1.webp',
      'assets/images/batamBuild2.jpeg',
      'assets/images/batamBuild3.webp',
    ],
    description:
        "Don't have enough time to commit to a Global Village trip or looking for a nearer destination? Build with us on Batam Island instead! Batam Build is designed as a short-term alternative for those who are unable to take a long break. Builds can be as short as 1 day, where participants can leave in the morning, build for half a day and return to Singapore in the evening. The maximum trip length for Batam Build is 2 days. Since 2014, Habitat's building efforts in Batam have been focused on transforming Kabil Village, a sub-district of Nongsa located in the Western side of the island. 40% of its over 20,000 residents live in substandard houses built using scrap wood and tin sheets. These small shacks are susceptible to water leaks, floods and sometimes structural collapse during the monsoon season. Habitat aims to improve the standard of living for 1,000 families through the reconstruction of new homes, improving the current water, drainage and electricity system.",
    fundings_recieved: 43000,
    fundings_needed: 100000,
    manpower: "27 / 100",
    organisation: "Habitat for Humanity Singapore",
    messages: [],
  ),
  Projects(
    name: 'Global Village',
    image: 'assets/images/globalVillage.jpg',
    gallery: [
      'assets/images/globalVillage1.jpg',
      'assets/images/globalVillage2.jpg',
      'assets/images/globalVillage3.jpg',
    ],
    description:
        "About Global Village: Building safe & affordable homes for families living in poverty Global Village gives volunteers in Singapore the opportunity to travel abroad and work with low-income communities across Asia-Pacific to improve families' access to decent living conditions. Volunteers will work as a team alongside the families that Habitat partner to build safe and affordable houses that these families can call home. Working side-by-side with the local community also offers the opportunity to immerse yourselves in the local culture and experience daily life in the host community. More importantly, the experience transforms lives: both for the volunteers and for partner families who see that there are “outsiders” who care enough to help them break the cycle of poverty.",
    fundings_recieved: 43000,
    fundings_needed: 100000,
    manpower: "27 / 100",
    organisation: "Habitat for Humanity Singapore",
    messages: [],
  ),
  Projects(
    name: 'V·Village',
    image: 'assets/images/habitat1.jpeg',
    gallery: [
      'assets/images/virtualVillage1.jpg',
      'assets/images/virtualVillage2.jpg',
      'assets/images/virtualVillage3.jpg',
    ],
    description:
        "V·Village (Virtual Village) is a way for you to transport yourself live to a Habitat house building project you support, wherever it may be in the world. Although it has been two years since we have been unable to travel for overseas builds, we still firmly believe that we have a responsibility to fight poverty not just locally but support overseas housing needs. Many families have a hard time thriving at home during the pandemic. Donate and witness the house transformation here in our time lapse photo. Your donation will go a long way to ensure that more homeowners have a safe and secure place to call home.",
    fundings_recieved: 0,
    fundings_needed: 100000,
    manpower: "27 / 100",
    organisation: "Habitat for Humanity Singapore",
    messages: [],
  ),
];

const USERS = [
  Users(
    name: "Frank William",
    image: 'assets/images/rav.jpg',
    amountDonated: "\$43.70",
  )
];
