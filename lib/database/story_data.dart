// import 'package:flutter/material.dart';
// import 'story_page.dart';
// import '../resources/constants.dart';
//
// //region Story Data
// // Bring this back later.
// List<StoryPage> _storyData = [
//   // The Intro contains one optional side portion
//   StoryPage(
//     location: '',
//     arcTitle: '',
//     pageText: RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//         text: 'Thatcher\n\n',
//         style: kTextAppTitle,
//         children: <TextSpan>[
//           TextSpan(
//             text: 'A Choose-Your-Own-Adventure Game\n\n',
//             style: kTextNarration,
//           ),
//           TextSpan(
//             text: 'by JesterVae',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: ['Continue', 'Start New'],
//     nextPageID: [1, 1],
//   ), // 0 >> 1
//   StoryPage(
//     location: '',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//         text: '“Impossible!”\n Chief of Policia Says\n\n',
//         style: kTextTitle,
//         children: <TextSpan>[
//           TextSpan(
//             text: '\t\tYesterday, Spire 17 was exposed to the Blight '
//                 'during the broadcast of Mn. Ernesto’s retirement, killing '
//                 'every person on Spire 17 that day. The official death '
//                 'toll may never be finalized, but it currently stands at '
//                 '8,418.\n\t\tThe Masonic Order, which organized the event and '
//                 'is also responsible for the investigation, is struggling to '
//                 'explain the situation. Their official statement: \n\n\t\t"The '
//                 'Spires are impenetrable. The '
//                 'Blight has never breached a Spire in our 1,200 years of '
//                 'recorded history. We can assure the public that Spire 17 has'
//                 ' been sealed off and the Blight contained. We mourn those '
//                 'we have lost, including the beloved Mason Ernesto, and we '
//                 'vow that we will find the criminal responsible. Justice '
//                 'will be served."\n\n\t\tThe Order and the Policia are '
//                 'investigating a break-in from 15 years ago. The'
//                 ' criminal, Anthony Fuller, was seen exiting Mason Ernesto\'s'
//                 ' home with an unknown number of documents. We cannot confirm'
//                 ' at this time, but an anonymous source in the Policia '
//                 'believes that Fuller may have stolen information detailing '
//                 'how to manipulate C-Max and used that knowledge to open the '
//                 'Spire and allow the Blight to enter. If that is what '
//                 'happened, we can assume that Fuller was the Blight\'s first '
//                 'casualty.\n\n\t\tMore details will follow in this tragic and '
//                 'unfolding story. Stay tuned.',
//             style: kTextBody,
//           ),
//         ],
//       ),
//     ),
//     choices: ['Continue'],
//     nextPageID: [2],
//   ), // 1 >> 2
//   // ~~|| CHOICE ||~~
//   StoryPage(
//     location: '',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: '-Special Investigator Garrett Thatcher sits in his home office '
//             'reading the article. He stands and slams his fist on the desk.-\n'
//             '\n',
//         style: kTextNarration,
//         children: <TextSpan>[
//           TextSpan(text: 'Bullshit!', style: kTextLoud),
//           TextSpan(
//             text: ' People are buying this? Some ignorant thief from the Dark'
//                 ' taught himself how to use C-Max, then just cracked open an '
//                 'invulnerable Spire?\n\n',
//             style: kTextBody,
//           ),
//           TextSpan(
//             text: '-Thatcher angrily paces the floor of his office.-\n\n',
//             style: kTextNarration,
//           ),
//           TextSpan(
//             text: 'Gotta do something about this. Sean was--Focus, Thatch! '
//                 'No time for that now. What do I do? Calm down. Get '
//                 'information. It had to be a Mason. Small pool of suspects. '
//                 'Talk to Theo. He\'ll know something.',
//             style: kTextBody,
//           ),
//         ],
//       ),
//     ),
//     choices: ['Message Theo'],
//     nextPageID: [3],
//   ), // 2 >> 3
//   StoryPage(
//     location: '',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: '-Thatcher hammers away at his terminal and quickly writes a '
//             'message.-\n\n',
//         style: kTextNarration,
//         children: <TextSpan>[
//           TextSpan(
//             text: 'TO: theodore.strayhorn@spire14\n'
//                 'FR: garrett.thatcher@spire5\n\t\n'
//                 'SB: No Subject\n'
//                 'Theo,\n\t\n'
//                 'Tell me everything '
//                 'you know about the living Masons. Keep it simple.\n\t\n'
//                 '-Thatch',
//             style: kTextEmail,
//           ),
//           TextSpan(
//             text: '',
//             style: kTextBody,
//           ),
//           TextSpan(
//             text: '\n\n-Thatcher begins pacing again.-\n\n',
//             style: kTextNarration,
//           ),
//           TextSpan(
//             text: 'Shouldn\'t have to wait too long. Still need to calm down.',
//             style: kTextBody,
//           ),
//         ],
//       ),
//     ),
//     choices: ['Wait for Message', 'Look Around'],
//     nextPageID: [4, 12],
//   ), // 3 >> 4
//   StoryPage(
//     location: '',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: '-A message notification snaps Thatcher out of his daze. He '
//             'rushes to the terminal to check it.-\n\n',
//         style: kTextNarration,
//         children: <TextSpan>[
//           TextSpan(
//             text: 'From: Theo Strayhorn\n'
//                 'To: Garrett Thatcher\n'
//                 'Subject:  What You Asked For\n\n'
//                 'I feel that, as a friend, I should warn you: You’re playing a '
//                 'very dangerous game investigating the Masons. The encryption on '
//                 'this email is unbreakable, so you have nothing to worry about '
//                 'here, but no doubt you will pursue this like everything else. If '
//                 'any of this comes back on me, I will deny involvement. \n\n'
//                 'Be careful, Thatch. You’re going up against a very powerful and '
//                 'secretive organization that manages to hide right out in the '
//                 'spotlight. Masons are near-deities on the Spires, so going after '
//                 'any of them is going to bring the Order down on you. Your '
//                 'Special Investigator badge may not protect you. Think this '
//                 'through, friend.'
//                 '\n\n'
//                 'You won\'t listen, so at least be careful.',
//             style: kTextEmail,
//           ),
//         ],
//       ),
//     ),
//     choices: ['File(s): 4'],
//     nextPageID: [5],
//   ), // 4 >> 5
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//           text: '-Thatcher\'s focus settles immediately on the four '
//               'files onscreen.-\n\n',
//           style: kTextNarration,
//           children: <TextSpan>[
//             TextSpan(
//                 text: 'First up: The Playboy. Always thought this kid sounded '
//                     'interesting.\n',
//                 style: kTextBody),
//           ]),
//     ),
//     choices: ['Michael'],
//     nextPageID: [6],
//   ), // 5 >> 6
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: 'Name: 	Michael\n',
//         style: kTextTitle,
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Age:	30\n'
//                 'Home Spire:	12\n\n',
//             style: kTextBody,
//           ),
//           TextSpan(
//             text:
//                 'Michael is a young Mason. He enjoys the power and fame that comes '
//                 'with being a Mason, which is uncharacteristic of the humility '
//                 'Masons typically employ. His work is of the finest quality, with a'
//                 ' youthful and artistic flair that will usher in a new age of '
//                 'Masonic architecture. \n\n'
//                 'Michael has a fondness for '
//                 'ancient languages and incorporates the script and numbers in '
//                 'his own work as artistic touches. He has a deep fondness for '
//                 'the ancient Roman numeral system that we still see on '
//                 'clock faces, and often uses that to number each building he '
//                 'modifies or renovates.\n\n'
//                 'But I suspect you aren\’t asking about my '
//                 'opinion on Michael as a Mason. What follows are unsubstantiated '
//                 'rumors:\n\n'
//                 'I have heard that Michael does not strictly follow the Masonic code.'
//                 ' He spends many nights at a not-so-secret club on Spire 12 called '
//                 '\' The Broken Tail\'. I believe you have had dealings there '
//                 'in  the past. \n\n'
//                 'There are other rumors that Michael and '
//                 'Ricardo do not get along very well, though the reasons '
//                 'are not known. Masons usually have close bonds with the '
//                 'apprentices they train. However, if the first rumor is true,'
//                 ' I could understand Ricardo\'s disapproval, as he is '
//                 'known to be a paragon of the Masonic Code.\n\n'
//                 'That\'s all I know about Michael, and most of it can probably be '
//                 'passed off as the bored squawking of the drunkards I spend my '
//                 'free time with.',
//             style: kTextBody,
//           ),
//         ],
//       ),
//     ),
//     choices: ['Ricardo'],
//     nextPageID: [7],
//   ), // 6 >> 7
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: 'Name:	Ricardo\n',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Age:	78\n',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: 'Spire:	16',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text:
//                 'Ricardo is the polar opposite of Michael, which may be why they '
//                 'allegedly do not get along. Ricardo trained Michael as well. '
//                 'He is immaculate in his adherence to Masonic code and '
//                 'traditional in his architecture, constantly paying homage to the'
//                 ' original Masons in his work. He is humble and generous, '
//                 'refusing his Masonic Palace for a much simpler apartment. He is '
//                 'growing old, which is causing some anxiety, but he is beloved '
//                 'and trusted by the people of his Spire. Given the loss of Mason '
//                 'Ernesto, rest his soul, Ricardo has been given special '
//                 'permission to find and train a new apprentice. '
//                 'Fun Fact: There was a time where the Spires had dozens of Masons '
//                 'at any given moment. Over these many centuries, however, it has '
//                 'become more difficult to find children talented in working with '
//                 'C-Max. This is why we have only five Masons today.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: [
//       'Benjamin',
//     ],
//     nextPageID: [8],
//   ), // 7 >> 8
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: 'Name:	Benjamin\n',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Age:	22\n',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: 'Spire:	7',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text:
//                 'Benjamin is the youngest mason and the successor of Ernesto, rest '
//                 'his soul. He demonstrated an uncanny affinity for both Masonic '
//                 'life and magic, and caught Ernesto’s eye quickly. A true genius, '
//                 'but so fresh that he has yet to show the world what he is capable '
//                 'of. He is also a talented musician. In fact, he was performing a '
//                 'concert at the time of the Spire’s collapse. Benjamin has a strong'
//                 ' political voice, and is very vocal about the inequality of the '
//                 'Tiers in each Spire. He also seems to be concerned with the '
//                 'Surface and very curious about what life was like before the '
//                 'invention of C-max and the Spires. He has contacted every library '
//                 'to probe for information about these things, including mine. I '
//                 'hear he has a strong distaste for the secrecy of the Order and is '
//                 'trying to push them into stepping out from the shadows. Youthful '
//                 'exuberance, wasted on fruitless pursuits. Remember when we were '
//                 'younger men, Thatch? Wanting to change the world, and look at us '
//                 'now. Stop by for a drink some time, old friend.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: ['Jeremiah'],
//     nextPageID: [9],
//   ), // 8 >> 9
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: 'Name:	Jeremiah\n',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Age:	55\n',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: 'Spire:	1',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text:
//                 'Jeremiah is a reclusive, but very gifted artist. His style is constantly'
//                 'adapting and taking elements from other Masons of the past and present.'
//                 'Unfortunately, He rarely grants audience to anyone, and spends nearly all'
//                 'his time researching or designing. He also refuses to allow people to'
//                 'watch him work, and he takes much longer than other Masons to complete'
//                 'even the most mundane remodeling task. It’s understood that he prefers a'
//                 'trial-and-error approach, and does not want his work to be seen until he '
//                 'is satisfied with the result.'
//                 'There are too many rumors about Jeremiah to list, due in large part to'
//                 'his secrecy and character. He never talks about himself, so the chatty'
//                 'types have filled in the many gaps with their own fanciful stories. I’ve'
//                 'heard it all: Some people say that he’s a vampire. Some say that he'
//                 'is so scared of his C-Max power that he worries about accidentally'
//                 'crafting a wall right through someone as he tries to shake their hand.'
//                 'Nonsense, of course, but always good for a laugh.'
//                 'The one thing I have heard that seems reasonable, though, is'
//                 'that he does not approve of the Masonic Order’s bureaucracy. Unknown to'
//                 'most is that there is a huge supporting network of people called'
//                 'the Order, but the Masons are the face and they are all that most '
//                 'people care to understand.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: ['Continue'],
//     nextPageID: [10],
//   ), // 9 >> 10
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: '<Thatcher opens his terminal to record an investigation log.>'
//             'Special Agent Garrett Thatcher. '
//             'Investing the collapse of Spire 17.'
//             'Start of Investigation: August 17th, 1204.'
//             'The Order...I wonder why they hide behind the Masons. Probably less '
//             'annoying, but maybe they\'re hiding something. I guess that’s what happens'
//             ' when the whole world takes something for granted for hundreds of years. '
//             'Benjamin’s fascination with the Surface has got me thinking, too. I '
//             'haven\'t thought about the Surface since I was a kid, when we all asked '
//             'questions. Probably unrelated to this investigation, but we all knew that '
//             'the Spires could not be manipulated until last week, so maybe it\'s time '
//             'we revisit childhood questions and things we thought we knew.',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Placeholder text for the moment. Stylize later.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: ['Continue'],
//     nextPageID: [11],
//   ), // 10 >> 11
//   // ~~|| TO ARCS ||~~
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: 'Placeholder\n',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Alright, so now I have the basic information about each '
//                 'Mason. I should probably start calling them suspects, '
//                 'since that’s what they are. Gotta distance myself from the  '
//                 'ingrained adoration we have for these guys. One of them '
//                 'is probably a mass murderer. So which suspect do I '
//                 'investigate first?',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: ['ARCS HERE'],
//     nextPageID: [19],
//     // linkedSituationIndex: 12, // just an example of how to do this
//     // situationalCellID: 13, // so I don't forget later
//   ), // 11 >> 19
//   // ~~|| THATCHER'S OFFICE ||~~
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: '<Thatcher looks around his office at home, hoping to focus '
//             'and calm his emotions.>'
//             '\n',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//       ),
//     ),
//     choices: ['The Urn', 'The Degree', 'The Certificate', 'The Guitar'],
//     nextPageID: [13, 14, 17, 18],
//   ), // 12 >> 13, 14, 17, 18
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: '<Thatcher looks at an ornate funerary urn. On the front of '
//             'the urn is a label in flowing script.>',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Zora Mae Thatcher',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: 'Gone too soon.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: 'Sorry, Love. There was nothing I could do to save you, '
//                 'but Sean...never thought something like this could happen.'
//                 ' I wish you were here. I need you.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: ['Wait for Message', 'Look Around'],
//     nextPageID: [4, 12],
//   ), // 13 >> 4, 12
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: '<Thatcher focuses on a framed degree hanging on the wall.>',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//       ),
//     ),
//     choices: ['Continue'],
//     nextPageID: [15],
//   ), // 14 >> 15
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: 'University of Spire Eight\n'
//             'The University of Spire Eight, upon the recommendation of the faculty, confers upon'
//             'Sean Julio Thatcher'
//             'who has satisfactorily met the standards and requirements set forth by the University for graduation the degree'
//             'Bachelor of Science'
//             'As evidence of attainments and the granting of all rights pertaining to that degree'
//             'The Spirelord of Spire Eight has issued this diploma on the tenth day of April in the year twelve hundred and thirty-four.',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//       ),
//     ),
//     choices: ['Continue'],
//     nextPageID: [16],
//   ), // 15 >> 16
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: 'Couldn\'t be prouder that you didn\'t follow my path. '
//             'I\'ll find the one who did this.',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//       ),
//     ),
//     choices: ['Wait for Message', 'Look Around'],
//     nextPageID: [4, 12],
//   ), // 16 >> 4, 12
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text:
//             '<Thatcher gazes at a wall of awards given to him through his service.>',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Always hated having these on the wall. Should be proud '
//                 'of my accomplishments, she said.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: '<Thatcher takes an award from the wall and holds it in '
//                 'his hands. Anger flashes across his face and he tears the '
//                 'page in half. He grabs another and tears it apart as well.'
//                 ' He sits down in his chair, hands clenched into fists, and'
//                 ' holds a scream deep in his throat like a growl.>',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: '<He stands and pulls down the remaining rewards. '
//                 'He stuffs them into the trashcan beside his desk and '
//                 'stares at the terminal.>',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: 'The award for capturing whoever killed my son will be '
//                 'the only one hanging on this wall. Well, that\'s enough '
//                 'calming down for me, time to get to work.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: ['Wait for Message'],
//     nextPageID: [4],
//   ), // 17 >> 4
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: '<Thatcher stands in front of a high-quality parlor guitar. '
//             'Abalone inlay in a rose pattern decorates the neck. The guitar'
//             'was skillfully cared for, but is worn from years of regular use.>',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Not much use for this thing since Zora died. Can\'t '
//                 'bring myself to get rid of it, though. Maybe learn how to '
//                 'play it?',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: '<Thatcher holds the guitar like she showed him. He '
//                 'strums like she showed him. It sounds terrible.>',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: 'Almost glad she\'s not around to hear that. Needs '
//                 'tuning, but mostly just a better player. Too old to learn '
//                 'something new, anyway.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//           TextSpan(
//             text: '<Thatcher gently returns the guitar to its stand. He '
//                 'looks around his office again.>',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: ['Wait for Message', 'Look Around'],
//     nextPageID: [4, 12],
//   ), // 18 >> 4, 12
//   // ~~|| EXIT ||~~
//   StoryPage(
//     location: 'Home',
//     arcTitle: 'Prologue',
//     pageText: RichText(
//       text: TextSpan(
//         text: 'The Final Countdown!',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         children: <TextSpan>[
//           TextSpan(
//             text: 'Just kidding. Back to the start.',
//             style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
//           ),
//         ],
//       ),
//     ),
//     choices: ['Restart'],
//     nextPageID: [1],
//   ) // 19 >> 1
// ]
// //endregion
