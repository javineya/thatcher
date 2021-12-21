import 'package:flutter/material.dart';
import 'package:thatcher/constants/constants.dart';
import '../database/story_page.dart';
import '../database/convo_card.dart';
import '../config/config.dart';

// TODO implement repeat dead-end protection feature
// TODO fix Hive issues -- pulling from different places

//region STORY DATA
List<StoryPage> _storyData = [
  //region Intro
  StoryPage(
    location: '',
    arcTitle: '',
    pageContents: [
      Container(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(text: 'Thatcher\n\n', style: kTextAppTitle),
              TextSpan(
                  text: 'A choose-your-own adventure story.\n\n',
                  style: kTextNarration),
              TextSpan(text: 'by JesterVae', style: kTextBody),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
    choices: ['Continue'],
    addSituation: 'gameInProgress',
    checkSituation: 'gameInProgress',
    nextPageID: [1],
  ), // 0 >> 1
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Column(children: [
          Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                style: kTextTerminalTitle,
                text: 'Tragedy!\n\n',
              ),
              TextSpan(
                style: kTextTerminal,
                text: 'The Fall of Spire 17\n\n',
              ),
            ]),
            textAlign: TextAlign.center,
          ),
          Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                  style: kTextTerminal,
                  text: 'One week ago today, during a Spire-wide celebration '
                      'of Mason Ernesto\'s retirement, the Blight was '
                      'discovered rapidly spreading throughout Tier 5, '
                      'colloquially referred to as "The Dark".\n\n'
                      'This unprecedented disaster prompted Mason Jeremiah to'
                      ' make the heart-wrenching choice to seal off Spire 17.'
                      ' His heroic and difficult decision spared the lives of'
                      ' all Spire residents, but at the unfortunate cost of '
                      'the thousands of residents and visitors on Spire 17.\n'
                      '\n'
                      'Investigation is no longer possible due to the Blight'
                      '\'s presence on Spire 17, but the Mason\'s Guild '
                      'believes that the incident was a result of a terrorist'
                      ' by the name of Anthony Fuller. Fifteen years ago, '
                      'Fuller was apprehended for breaking and entering Mason'
                      ' Ernesto\'s home. The Guild believes that he stole '
                      'documents detailing how to manipulate C-Max, spending '
                      'years in secret searching for a vulnerability. Fuller '
                      'was rejected from the Mason\'s Guild as a child, and '
                      'may have sought revenge.\n\n'
                      'Mason Jeremiah has retreated to his home to recover '
                      'from the trauma, but has assured the public that there'
                      ' is no further danger. Spire 17, as we know, was the '
                      'last Spire to be constructed, and it was done in '
                      'haste, which likely resulted in mistakes that the '
                      'other Spires simply do not have. Furthermore, whoever '
                      'the culprit of this devastating act of terror, they '
                      'were surely the Blight\'s first victim the moment they'
                      ' breached the outer wall.\n\n'
                      'Let us mourn those we lost, and give thanks to the '
                      'swift intervention of Mason Jeremiah. The Guild asks '
                      'that we respect his privacy and give him time to '
                      'grieve and heal, for his was a great sacrifice to save'
                      ' us all.'),
            ]),
            textAlign: TextAlign.left,
          )
        ]),
      )
    ],
    choices: ['Continue'],
    nextPageID: [2],
  ), // 1 >> 2
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: kTextNarration,
                text: '-- Special Investigator Garrett Thatcher sits at '
                    'his desk, staring at the article on his terminal screen. '
                    'He slams his fist on the desk. --\n\n',
              ),
              TextSpan(
                style: kTextLoud,
                text: 'Bullshit! ',
              ),
              TextSpan(
                style: kTextBody,
                text: 'No one will buy this crap! Some poor thief '
                    'from the Dark taught himself how to use C-Max, then '
                    'decided to practice by cracking the impenetrable walls of '
                    'a Spire?\n\n',
              ),
              TextSpan(
                style: kTextNarration,
                text: '-- Thatcher stands and paces around his desk '
                    'while muttering to himself. --\n\n',
              ),
              TextSpan(
                style: kTextBody,
                text: 'Gotta find out what happened. Why are they lying? '
                    'Gotta be hiding something. Focus! If C-Max is involved, '
                    'had to be a Mason. That explains the lies. What now? Talk '
                    'to Theo, get info on the Masons.\n\n',
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      )
    ],
    choices: ['Continue'],
    nextPageID: [3],
  ), // 2 >> 3
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Column(
          children: [
            Container(
              child: Text(
                  '-- Thatcher taps his terminal screen and brings up'
                  ' the messenger. A keyboard appears on his desk surface, '
                  'and he begins rapidly typing a message. --\n\n',
                  style: kTextNarration),
            ),
            Container(
              decoration: kBoxMessage,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        style: kTextTerminal,
                        text: 'TO: theodore.strayhorn@spire14\n',
                      ),
                      TextSpan(
                        style: kTextTerminal,
                        text: 'FR: garrett.thatcher@si.spire5\n',
                      ),
                      TextSpan(
                        style: kTextTerminal,
                        text: 'SB: No Subject\n\n',
                      ),
                      TextSpan(
                          style: kTextTerminal,
                          text: 'Tell me everything you know about the living '
                              'Masons. Keep it short.')
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            )
          ],
        ),
      )
    ],
    choices: ['Send'],
    nextPageID: [4],
  ), // 3 >> 4
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: kTextNarration,
                text: '-- Thatcher stands and begins pacing around his '
                    'desk again. --\n\n',
              ),
              TextSpan(
                style: kTextBody,
                text: 'Won\'t have to wait long for an answer. Gotta '
                    'calm down. Breathe, Thatch. Focus.\n\n',
              ),
              TextSpan(
                style: kTextNarration,
                text: '-- Thatcher looks around the room, deciding '
                    'whether to wait for the message or take his mind off '
                    'of things and relax. --',
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      )
    ],
    choices: ['Wait', 'Look Around'],
    nextPageID: [5, 12],
  ), // 4 >> 5,12
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
          child: Column(children: [
        Container(
          child: Text(
            '-- A message notification snaps Thatcher out of his daze. He '
            'rushes to the terminal. --\n\n',
            style: kTextNarration,
          ),
        ),
        Container(
          decoration: kBoxMessage,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: kTextTerminal,
                    text: 'FR: theodore.strayhorn@spire14\n'
                        'TO: garrett.thatcher@si.spire5\n'
                        'SB:  I Know What You\'re Planning\n\n'
                        'First, as a friend, I should warn you: You’re playing'
                        ' a very dangerous game investigating the Masons, '
                        'though no doubt you will pursue this like everything else. \n\n'
                        'Be careful, Thatch. You’re going up against a very '
                        'powerful organization. Masons are near-deities on '
                        'the Spires, so going after any of them is going to '
                        'bring the Guild down on you. Your Special '
                        'Investigator badge may not protect you. Think this '
                        'through, friend.'
                        '\n\n'
                        'You won\'t listen, so at least be careful. I '
                        'attached the info on the four remaining Masons. May '
                        'Ernesto rest in peace.',
                  )
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        )
      ]))
    ],
    choices: ['Open Files'],
    nextPageID: [6],
  ), // 5 >> 6
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: kTextNarration,
                text: '-- '
                    'Thatcher taps on the attachments, downloading the four '
                    'files to his terminal. --\n\n',
              ),
              TextSpan(
                style: kTextBody,
                text: 'Okay, one of these four Masons is likely our terrorist'
                    '. Let\'s see if Theo actually managed to keep it short.'
                    '\n\n'
                    'First up, the wild child.',
              )
            ],
          ),
          textAlign: TextAlign.left,
        ),
      )
    ],
    choices: ['Michael'],
    nextPageID: [7],
  ), // 6 >> 7
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        decoration: kBoxFile,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Name: Michael\n'
                      'Age:	30\n'
                      'Home: Spire 12\n\n',
                  style: kTextTerminal,
                ),
                TextSpan(
                  text:
                      'Michael is a young Mason. He enjoys the power and fame that comes '
                      'with being a Mason, which is uncharacteristic of the humility '
                      'Masons typically employ. His work is of the finest quality, with a'
                      ' youthful and artistic flair that will usher in a new age of '
                      'Masonic architecture. \n\n'
                      'Michael has a fondness for '
                      'ancient languages and incorporates the script and numbers in '
                      'his own work as artistic touches. He has a deep fondness for '
                      'the ancient Roman numeral system that we still see on '
                      'clock faces, and often uses that to number each building he '
                      'modifies or renovates.\n\n'
                      'But I suspect you aren\’t asking about my '
                      'opinion on Michael as a Mason. What follows are unsubstantiated '
                      'rumors:\n\n'
                      'I have heard that Michael does not strictly follow the Masonic code.'
                      ' He spends many nights at a not-so-secret club on Spire 12 called '
                      '\'The Broken Tail\'. I believe you have had dealings there '
                      'in the past. \n\n'
                      'There are other rumors that Michael and '
                      'Ricardo do not get along very well, though the reasons '
                      'are not known. Masons usually have close bonds with the '
                      'apprentices they train. However, if the first rumor is true,'
                      ' I could understand Ricardo\'s disapproval, as he is '
                      'known to be a paragon of the Masonic Code.\n\n'
                      'That\'s all I know about Michael, and most of it can probably be '
                      'passed off as the bored squawking of the drunkards I spend my '
                      'free time with.',
                  style: kTextTerminal,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      )
    ],
    choices: ['Ricardo'],
    nextPageID: [8],
  ), // 7 >> 8
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        decoration: kBoxFile,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Name: Ricardo\n'
                      'Age:	78\n'
                      'Home: Spire 16\n\n',
                  style: kTextTerminal,
                ),
                TextSpan(
                  text:
                      'Ricardo is the polar opposite of Michael, which may be why they '
                      'allegedly do not get along. Ricardo trained Michael, '
                      'as Michael\'s file mentions. '
                      'Ricardo is immaculate in his adherence to Masonic code '
                      'and '
                      'traditional in his architecture, constantly paying homage to the'
                      ' original Masons in his work. \n\n'
                      'He is humble and generous, refusing his Masonic Palace'
                      ' for a much simpler '
                      'apartment. He is beloved and trusted by the people of his Spire. He is '
                      'growing old, which is causing some anxiety, but given '
                      'the loss of Mason '
                      'Ernesto, rest his soul, Ricardo has been given special '
                      'permission to find and train a new apprentice. \n\n'
                      'Fun Fact: There was a time where the Spires had dozens of Masons '
                      'at any given moment. Over these many centuries, however, it has '
                      'become more difficult to find children talented in working with '
                      'C-Max. This is why we have only five Masons today.\n\n'
                      'Oh, dear. Four Masons, my mistake. That fact was not '
                      'fun at all.',
                  style: kTextTerminal,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      )
    ],
    choices: ['Benjamin'],
    nextPageID: [9],
  ), // 8 >> 9
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        decoration: kBoxFile,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Name: Benjamin\n'
                      'Age:	22\n'
                      'Home: Spire 7\n\n',
                  style: kTextTerminal,
                ),
                TextSpan(
                  text: 'Benjamin is the youngest Mason and the successor of '
                      'Ernesto, rest '
                      'his soul. He demonstrated an uncanny affinity for both Masonic '
                      'life and magic, and caught Ernesto’s eye quickly. A true genius, '
                      'but so fresh that he has yet to show the world what he is capable '
                      'of. He is also a talented musician. In fact, he was performing a '
                      'concert at the time of the Spire’s collapse. Benjamin has a strong'
                      ' political voice, and is very vocal about the inequality of the '
                      'Tiers in each Spire. \n\n'
                      'He also seems to be concerned with the '
                      'Surface and very curious about what life was like before the '
                      'invention of C-max and the Spires. He has contacted every library '
                      'to probe for information about these things, including'
                      ' mine. \n\n'
                      'I hear he has a strong distaste for the secrecy of the '
                      'Guild and is trying to push them into stepping out '
                      'from the shadows and including women as possible '
                      'candidates for Masons. \n\n'
                      'Remember when we were younger men, Thatch? Wanting to '
                      'change the world...look at us now. Stop by for a drink'
                      ' some time, old friend.',
                  style: kTextTerminal,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      )
    ],
    choices: ['Jeremiah'],
    nextPageID: [10],
  ), // 9 >> 10
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        decoration: kBoxFile,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Name: Jeremiah\n'
                      'Age:	55\n'
                      'Home: Spire 1\n\n',
                  style: kTextTerminal,
                ),
                TextSpan(
                  text: 'Jeremiah is a reclusive, but very gifted artist. His '
                      'style is constantly adapting and evolving. He '
                      'incorporates elements from all known Masons and adds '
                      'variations of his own. He is the most sought-after '
                      'Mason by the Tier 1 residents and works almost '
                      'exclusively with them.\n\n '
                      'Unfortunately, he rarely grants audience to anyone, '
                      'and spends nearly all'
                      ' his time researching or designing. \n\n'
                      'He also refuses'
                      ' to allow people to '
                      'watch him work, and he takes much longer than other '
                      'Masons to complete '
                      'even the most mundane remodeling task. It’s understood that he prefers a'
                      ' trial-and-error approach, and does not want his work '
                      'to be seen until he '
                      'is satisfied with the result.\n\n'
                      'There are too many rumors about Jeremiah to list, due in large part to'
                      ' his secrecy and character. He never talks about '
                      'himself, so the chatty '
                      'types have filled in the many gaps with their own fanciful stories. I’ve'
                      ' heard it all: \n'
                      'Some people say that he’s a vampire. \n'
                      'Some say that he '
                      'is so scared of his C-Max power that he worries about accidentally'
                      ' crafting a wall right through someone as he tries to '
                      'shake their hand.\n'
                      'Others believe he lost much of his humanity from Spire'
                      ' Sickness.\n\n'
                      'All nonsense, of course. No one has ever survived '
                      'Spire Sickness, as you are painfully aware. Rest '
                      'easy, Zora.\n\n'
                      'The one thing I have heard that seems reasonable, though, is'
                      ' that he does not approve of the Masonic Guild’s '
                      'bureaucracy. Unknown to most is that there is'
                      ' a huge supporting network of people involved in the Guild, but '
                      'the Masons are the face of the Guild, and most people '
                      'are okay with knowing little else about it.',
                  style: kTextTerminal,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      )
    ],
    choices: ['Continue'],
    nextPageID: [11],
  ), // 10 >> 11
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '-- Thatcher leans back in his chair and stares at '
                      'the ceiling. --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'One of these Masons is probably a mass murderer, '
                      'unless Ernesto decided to take a whole Spire with him '
                      'when he retired.\n\n'
                      'Gotta be smart about this, and quiet. Erase these '
                      'files first, scrub my messages with Theo, call in some'
                      ' vacation time. Plenty of reason to ask for that...\n\n'
                      'Alright, Thatch: Who do we look at first?',
                  style: kTextBody,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      )
    ],
    choices: ['Michael'],
    addSituation: "restart",
    checkSituation: "restart",
    nextPageID: [0],
  ), // 11 >> ARCS
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '-- Thatcher looks around his office, focusing on '
                      'a few important objects to help clear his mind. --\n\n',
                  style: kTextNarration,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      )
    ],
    choices: ['The Urn', 'The Degree', 'The Award', 'The Guitar'],
    nextPageID: [13, 14, 15, 16],
  ), // 12 >> 13,14,15,16
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '-- Thatcher looks at an ornate funerary urn sitting '
                        'on a shelf among well-tended flowering plants. --\n\n',
                    style: kTextNarration,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              decoration: kBoxUrn,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Zora Miriam Thatcher\n\n\n',
                          style: kTextFancyBig,
                        ),
                        TextSpan(
                          text: 'Gone Too Soon\n',
                          style: kTextNarration,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '\nZora, wish you were here. You\'d be so proud of '
                        'our son. He\'s a doctor, Zora. Says he\'s gonna cure'
                        ' Spire Sickness someday. He\'ll do it, too. He\'s so'
                        ' sma--\n\n',
                    style: kTextBody,
                  ),
                  TextSpan(
                    text: '-- Thatcher rakes a sleeve across his damp eyes '
                        'and inhales deeply. He exhales slowly and looks '
                        'around the room again. --',
                    style: kTextNarration,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      )
    ],
    choices: ['Wait for Theo', 'The Degree', 'The Award', 'The Guitar'],
    nextPageID: [5, 14, 15, 16],
  ), // Urn     13 >> 5,14,15,16
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '-- Thatcher\'s eyes come to rest on a framed '
                        'degree hanging below a picture of a handsome young '
                        'man. --\n'
                        '\n',
                    style: kTextNarration,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              decoration: kBoxPaper,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'All-Spire Medical University\n\n',
                          style: kTextOlde,
                        ),
                        TextSpan(
                          text: 'in consideration of the satisfactory '
                              'completion of'
                              ' all requirements prescribed by the faculty, '
                              'hereby confers upon'
                              '\n',
                          style: kTextNarration,
                        ),
                        TextSpan(
                          text: 'Sean Julio Thatcher\n\n',
                          style: kTextTitle,
                        ),
                        TextSpan(
                          text: 'the degree of'
                              '\n',
                          style: kTextNarration,
                        ),
                        TextSpan(
                          text: 'Medical Doctor\n\n',
                          style: kTextTitle,
                        ),
                        TextSpan(
                          text: 'together with all the rights, privileges, '
                              'and responsibilities pertaining thereto. '
                              'Completed with the seal of our Spirelord and '
                              'authorized on this day:\n\n'
                              'June Seventeenth, 1237'
                              '\n',
                          style: kTextNarration,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '\nI know you\'re okay, son. If anyone is okay, it'
                        '\'s you.\n\n',
                    style: kTextBody,
                  ),
                  TextSpan(
                    text: '-- Thatcher quickly lets his gaze roam, denying '
                        'himself time to consider that he may be wrong. --',
                    style: kTextNarration,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      )
    ],
    choices: ['The Urn', 'Wait for Theo', 'The Award', 'The Guitar'],
    nextPageID: [13, 5, 15, 16],
  ), // Degree  14 >> 13,5,15,16
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '-- Thatcher\'s gaze falls on a wall full of framed'
                        ' awards and certificates. One award is displayed '
                        'more prominently than the rest. --\n'
                        '\n',
                    style: kTextNarration,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              decoration: kBoxPaper,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Special Investigator\n\n',
                          style: kTextOlde,
                        ),
                        TextSpan(
                          text: 'Empowered with all the rights and privileges'
                              ' granted in the All-Spire Constitution.\n',
                          style: kTextNarration,
                        ),
                        TextSpan(
                          text: 'Garrett Bernard Thatcher\n\n',
                          style: kTextTitle,
                        ),
                        TextSpan(
                          text: 'has sworn to uphold the code of this position'
                              ' and never to abuse this authority.\n\n',
                          style: kTextNarration,
                        ),
                        TextSpan(
                          text: 'January 1, 1224',
                          style: kTextNarration,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '\nSo tacky. Should have taken this all down years '
                        'ago. Zora, you always liked showing off everyone '
                        'else. Wish you liked matching picture frames.\n\n',
                    style: kTextBody,
                  ),
                  TextSpan(
                    text: '-- Thatcher smiles and runs his fingers gently '
                        'across the top of the carved wooden frame in the '
                        'same spot as always, worn by years of the same '
                        'treatment from Thatcher\'s deceased wife. --',
                    style: kTextNarration,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      )
    ],
    choices: ['The Urn', 'The Degree', 'Wait for Theo', 'The Guitar'],
    nextPageID: [13, 14, 5, 16],
  ), // Award   15 >> 13,14,5,16
  StoryPage(
    location: '',
    arcTitle: 'Intro',
    pageContents: [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '-- Thatcher picks up a guitar leaned against his '
                      'desk. He deftly plucks a few notes. --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'Wow, out of tune. Guess it has been quite a while '
                      'since it had any reason to be in tune. Maybe I should '
                      'pick it back up...\n\n Maybe after I solve this case.\n'
                      '\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- Thatcher puts the guitar back down and stares '
                      'blankly at the floor for a moment before snapping '
                      'himself out of his reverie. --',
                  style: kTextNarration,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      )
    ],
    choices: ['The Urn', 'The Degree', 'The Award', 'Wait for Theo'],
    nextPageID: [13, 14, 15, 5],
  ), // Guitar  16 >> 13,14,15,
  //endregion
  //region MICHAEL
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Alright, let\'s go have a chat with the playboy. '
                      'Should talk to D first. See if she\'s still in charge '
                      'of Broken Tail. Been a long time...wonder if she\'s '
                      'still mad.\n\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- Thatcher heads to the terminal to catch a tube to'
                      ' Spire 12. --',
                  style: kTextBody,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Continue'],
      addSituation: 'visitedMichael',
      nextPageID: [0]), // 17 >> 18
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            Container(
              child: Text(
                  '-- Thatcher arrives on Spire 12 and '
                  'quickly finds a com booth at the terminal. He reluctantly '
                  'punches in a number and waits for an answer. --\n\n',
                  style: kTextNarration),
            ),
            ConvoCardRight(convoText: 'Yeah, who is it?'),
            ConvoCardLeft(
                convoText:
                    'That any way to talk to a \nSpecial Investigator, D?'),
            ConvoCardRight(convoText: 'Thatch?'),
            ConvoCardLeft(convoText: 'Que pasa? Long time no see.'),
            ConvoCardRight(
                convoText: 'Not long enough. And don\'t speak my language, '
                    'cabron. It grates my ears.'),
            ConvoCardLeft(convoText: 'Missed you, too.'),
            ConvoCardRight(convoText: 'What do you want? I\'m busy.'),
            ConvoCardLeft(
                convoText: 'Need to have a chat with someone at your bar.'),
            ConvoCardRight(
                convoText: 'Why should I help you? I owe you nothing.'),
          ]),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Truth', 'Lie'],
      nextPageID: [19, 19]), // 18 >> 19
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            Container(
              child: Text('-- Thatcher decides to tell the truth. --\n\n',
                  style: kTextNarration),
            ),
            ConvoCardLeft(
                convoText: 'Spire 17. The police have the wrong guy, '
                    'and someone at your club has info.'),
            ConvoCardRight(
                convoText: 'What do I care about that? It wasn\'t '
                    'my Spire.'),
            ConvoCardLeft(convoText: 'D, help me out.'),
            ConvoCardRight(
                convoText: 'It\'s Deonara. Tell you what, '
                    'there is something you can do for me.'),
            ConvoCardLeft(convoText: 'What\'s that?'),
            ConvoCardRight(
                convoText: 'Someone is dealing in my club. I don'
                    '\'t deal with drugs anymore, but I don\'t know who it is. '
                    'Find them, give them to me, and I\'ll let you in.'),
            ConvoCardLeft(
                convoText: 'Give them to you? Sounds an awful lot like '
                    'accomplice to murder.'),
            ConvoCardRight(
                convoText: 'What do you care what happens? You want your '
                    'info, right?'),
            ConvoCardLeft(
                convoText: 'No one needs to die, but this dealer can be dealt'
                    ' with by law. Deal?'),
            ConvoCardRight(
                convoText: 'No good. I gotta send a message, and I don\'t '
                    'want that message to be that I work with the police.'),
            ConvoCardLeft(convoText: 'D, we can find--'),
            ConvoCardRight(convoText: 'Look, that\'s the deal. You in or not?'),
          ]),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Agree', 'Decline'],
      nextPageID: [20, 20]), // 19 >> 20, XX
  //region D's Favor
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            Container(
              child: Text(
                  '-- Thatcher decides to agree to the deal, thinking'
                  ' that he can figure out a way to maintain his morals later. '
                  '--\n\n',
                  style: kTextNarration),
            ),
            ConvoCardLeft(convoText: 'Fine, it\'s a deal.'),
            ConvoCardRight(
                convoText: 'Wow, this must be really important to you. '
                    'Thought for sure you\'d turn that down. What is this '
                    'really about, Thatch?'
                    '.'),
            ConvoCardLeft(convoText: 'Do you care?'),
            ConvoCardRight(
                convoText: 'Not really, but everyone loves a little gossip.'),
            ConvoCardLeft(convoText: 'Where is the club, D?'),
            ConvoCardRight(
                convoText: 'I\'ll have one of my boys show you. Hang around '
                    'the station, it won\'t take long.'),
            ConvoCardLeft(convoText: 'Thanks.'),
            ConvoCardRight(
                convoText: 'This is mutual benefit, Thatch. No need to thank '
                    'me, just give me the dealer.'),
            Container(
              child: Text(
                  '\n\n-- The com goes silent. Thatcher steps out of the booth '
                  'and waits for his escort to arrive. --\n\n',
                  style: kTextNarration),
            ),
          ]),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Continue'],
      nextPageID: [21]), // 20 >> 21
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '-- Thatcher doesn\'t wait long. A brute of a man '
                      'appears and walks straight up to him. Without a '
                      'word, the man nods, turns, and begins briskly walking '
                      'away.'
                      ' --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'No pleasantries, huh? Fine by me.\n\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- Thatcher follows the man through twisting alleys,'
                      ' sudden turns, and frequent stops. It\'s clear that '
                      'the man is making it difficult for Thatcher to '
                      'remember his path. --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'This is wasting both of our time, friend. Get to the'
                      ' point already. We\'ve been circling the same block '
                      'for fifteen minutes.\n\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- The man stops, chuckles, and wordlessly points to'
                      ' a bakery they have passed several times already. '
                      'Thatcher raises an eyebrow, but the man begins '
                      'lumbering quickly away before he can say a word. --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'A bakery, huh? Let\'s see what we\'ve got inside.\n\n',
                  style: kTextBody,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Continue'],
      nextPageID: [22]), // 21 >> 22
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '-- Thatcher enters the bakery. It looks like a '
                      'normal bakery, except that the baker appears to be cut'
                      ' from the same stone as the man who led Thatcher here. '
                      '--\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'Don\'t suppose you\'ve got a cinnamon roll warmed up'
                      ' for me?\n\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- Without a word, the man throws a thumb over his '
                      'shoulder, motioning Thatcher into the room behind the '
                      'counter. --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'You know, this whole \'silent giant\' thing is cute.'
                      ' You boys should start a comedy troupe or something.'
                      '\n\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- Thatcher heads into the back room, where a '
                      'too-attractive woman is standing next to an enclosed '
                      'storage rack for allowing the dough to rise. With a '
                      'gentle push, the rack slides sideways and reveals a '
                      'staircase leading down. Above the entrance, the '
                      'symbol VI is etched into the wall. --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'Shouldn\'t it be VIP? Nevermind, forgot about the '
                      'silent game you all play here.'
                      '.\n'
                      '\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- The woman smiles and gestures down the staircase.'
                      ' Thatcher heads down. --\n\n',
                  style: kTextNarration,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Continue'],
      nextPageID: [23]), // 22 >> 23
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '-- The bread rack slides closed behind Thatcher, and'
                      ' the corridor goes dark. Almost as quickly, a soft '
                      'glow radiates from the floor, showing the stairs. The '
                      'glow brightens until the corridor is comfortably lit.'
                      '\n\n'
                      'Thatcher takes a moment to orient himself, and begins '
                      'walking, talking to himself as usual. --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'Interesting. No one but a Mason could have made this'
                      '. Was it Michael, or is this even older? Guess the '
                      'Masons aren\'t saints behind closed doors.\n\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- Thatcher walks confidently down the corridor, '
                      'which is far longer than he expected. He finally '
                      'sees a door, and it slides open as he gets closer. --\n'
                      '\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'Should come back and investigate this later, but now'
                      ' is not the time.\n\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- Passing the door, Thatcher walks into an '
                      'octagon-shaped room with doors on every side. --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'So the bakery isn\'t the only secret entrance. This '
                      'place is impressive.\n\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- One of the doors slides open, and Thatcher is '
                      'overwhelmed by loud, thumping music he couldn\'t '
                      'hear before. A woman wearing a beautiful dress '
                      'smiles at Thatcher like an old friend, and walks '
                      'straight up to him. --\n\n',
                  style: kTextNarration,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Continue'],
      nextPageID: [24]), // 22 >> 23
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            Container(
              child: Text(
                  '-- Thatcher smiles at the woman and nods slightly.'
                  ' --\n',
                  style: kTextNarration),
            ),
            ConvoCardRight(convoText: 'Welcome, Mr...?'),
            ConvoCardLeft(convoText: 'You can call me Garrett. No Mr.'),
            ConvoCardRight(
                convoText: 'Alright, Garrett. Allow me to show you'
                    ' inside.'),
            ConvoCardLeft(convoText: 'Excellent. Lead the way, Miss...'),
            ConvoCardRight(convoText: 'And you can call me Emma.'),
            ConvoCardLeft(
                convoText: 'It\'s my first time here, Emma, you '
                    'mind giving me a quick tour?'),
            ConvoCardRight(
                convoText: 'I would love to, but my job is to '
                    'greet the guests. I\'m happy to introduce you to someone who'
                    ' will help you.'),
            ConvoCardLeft(convoText: 'I\'m really just looking for a friend.'),
            ConvoCardRight(convoText: 'Well, we can help you with that, too.'),
            Container(
              child: Text('\n-- Thatcher blushes and then chuckles. --\n\n',
                  style: kTextNarration),
            ),
            ConvoCardLeft(
                convoText: 'Oh no, not that--a friend told me to meet him '
                    'here, but I don\'t know where he is.'),
            ConvoCardRight(
                convoText: 'I see. My mistake. And who is your friend?'),
          ]),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Michael', 'The Dealer'],
      nextPageID: [25, 25]), // 24 >> 25, XX
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            Container(
              child: Text('-- Thatcher decides to tell the truth. --\n',
                  style: kTextNarration),
            ),
            ConvoCardLeft(convoText: 'Michael, the Mason.'),
            ConvoCardRight(
                convoText: 'A Mason? Here? I\'m afraid you must be mistaken,'
                    ' Garrett.'),
            ConvoCardLeft(
                convoText: 'Interesting. Told me to meet him here '
                    'but he doesn\'t come?'),
            ConvoCardRight(
                convoText: 'I am sorry for the confusion. You are '
                    'here now, and you\'re free to come in and take a look around'
                    '.'),
            ConvoCardLeft(
                convoText: 'Thank you, Emma. If Michael is here, he\'ll be '
                    'sure to know that you protected him.'),
            ConvoCardRight(
                convoText: 'Have a wonderful evening, Garrett. And if you '
                    'find yourself looking for a different friend, come and '
                    'see me and I\'ll arrange all the details.'),
            Container(
              child: Text(
                  '\n-- Thatcher sheepishly nods and walks away from '
                  'Emma, deeper into the club. He calmly scans the room. The '
                  'floor he stands on is a large dance floor. A live band '
                  'plays on a short stage. A second floor circles the entire '
                  'dance floor, where patrons sit at tables drinking, '
                  'talking, and watching the dance floor. Thatcher sees a '
                  'staircase across the dance floor. --\n'
                  '\n',
                  style: kTextNarration),
            ),
            Container(
                child: Text(
                    'Too many people here. Better view from the second '
                    'floor.\n\n',
                    style: kTextBody)),
            Container(
              child: Text(
                  '-- Thatcher makes his way across the dance a floor; a sea '
                  'of people in expensive clothes. He heads up the '
                  'staircase, but finds that it splits halfway. To the '
                  'left, the staircase opens onto the second floor. To '
                  'the right, it leads to a door with a keypad. --\n\n',
                  style: kTextNarration),
            )
          ]),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Second Floor', 'The Door'],
      nextPageID: [26, 26]), // 25 >> 26, XX
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '-- Thatcher goes left, up the stairs and onto the '
                      'second floor. Immediately, he is approached by another'
                      ' attractive woman, only this time there are two guards'
                      ' flanking her. She smiles brightly and motions for '
                      'Thatcher to ignore the two men. The booming music on '
                      'the second floor gives cause for her expressiveness, '
                      'and she leans very close to Thatcher, turning an ear '
                      'toward him. --\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'Where is Michael?\n\n',
                  style: kTextBody,
                ),
                TextSpan(
                  text: '-- Thatcher asks the question directly into her ear,'
                      ' but distant enough to see her face. Her bright smile '
                      'slips for an instant, but she regains it and steps '
                      'back. She gestures to a large corner table and moves '
                      'quickly to greet another guest that has appeared '
                      'at the top of the stairs.\n\n',
                  style: kTextNarration,
                ),
                TextSpan(
                  text: 'Thatcher makes his way to the table. He sees a '
                      'young, decent-looking man sitting alone at a large '
                      'table, with drugs in plain view. Bottles of alcohol '
                      'sit neatly arranged in the center of the table, some '
                      'opened, some empty, but mostly sealed. Thatcher '
                      'steps into the booth and the music volume instantly '
                      'lowers. The man looks up with curiosity. --\n'
                      '\n',
                  style: kTextNarration,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Continue'],
      nextPageID: [27]), // 26 >> 27
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            Container(
              child: Text(
                  '-- Michael looks at Thatcher with knowing bemusement. He '
                  'immediately begins speaking, slow and '
                  'melodramatically as if to make clear that he is not '
                  'at all afraid of Thatcher. --\n',
                  style: kTextNarration),
            ),
            ConvoCardRight(
                convoText: 'What can I do for you, Mr. Investigator?'),
            ConvoCardLeft(convoText: 'Smart kid. Good, saves a lot of time.'),
            ConvoCardRight(
                convoText: 'Kid? So you\'re just another old man '
                    'here to tell me what to do. Did the Guild send you?'),
            ConvoCardLeft(
                convoText: 'Not interested in your shit, kid. Where were you '
                    'when Spire 17 was breached?'),
            ConvoCardRight(
                convoText: 'Ooh, looks like you\'re a smart kid, too.'),
            Container(
              child: Text(
                  '\n-- Thatcher pounds his fist on the table, but Michael only'
                  ' looks at him with fascination, almost daring him to '
                  'act. --\n\n',
                  style: kTextNarration),
            ),
            ConvoCardLeft(convoText: 'Answer the question.'),
            ConvoCardRight(
                convoText: 'I was here, watching on the screen. '
                    'Let me show you.'),
            Container(
              child: Text(
                  '\n-- Michael presses a finger on a raised circle Thatcher '
                  'hadn\'t noticed on the table. Nothing happens. '
                  'Thatcher looks at him with growing impatience, and '
                  'Michael points up. Above his head, Thatcher sees a '
                  'paper-thin screen sliding downward out of the '
                  'ceiling. --\n',
                  style: kTextNarration),
            ),
            ConvoCardLeft(
                convoText: 'Neat trick, but C-Max can\'t change '
                    'without a Mason.'),
            ConvoCardRight(convoText: 'Why don\'t you try, then?'),
            Container(
                child: Text(
                    '\n-- Michael raises his hands and gestures to the raised '
                    'button on the table. '
                    'Thatcher leans in and pushes it, while twisting to see the'
                    ' screen. Without a sound, it slides back up into the '
                    'ceiling and disappears. Thatcher looks at Michael\'s '
                    'hands, which are still raised. --\n',
                    style: kTextNarration)),
            ConvoCardRight(convoText: 'You see? I\'m not touching anything.'),
          ]),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Continue'],
      nextPageID: [28]), // 27 >> 28
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            ConvoCardLeft(convoText: 'Are you testing me?'),
            ConvoCardRight(
                convoText: 'I\'m starting to like you, Mr. Investigator.'),
            ConvoCardLeft(
                convoText: 'So you can break the rules. Why show me'
                    ' this?'),
            ConvoCardRight(convoText: 'I think you already know the answer.'),
            ConvoCardLeft(convoText: 'You can break the other rules, too.'),
            ConvoCardRight(
                convoText: 'Well, not me. I only break this rule, and only in'
                    ' private. Plus I\'d never kill all those innocent people'
                    '.'),
            ConvoCardLeft(
                convoText: 'You wouldn\'t be the first murderer to claim '
                    'innocence.'),
            ConvoCardRight(
                convoText: 'I am trying to help, you know. This is'
                    ' the only rule I can break with C-Max.'),
            ConvoCardLeft(
                convoText: 'So you say. Sitting in an illegal club, with a '
                    'pile of drugs between us, it\'s hard to find trust.'),
            ConvoCardRight(
                convoText: 'Fair enough. You\'re on the right '
                    'track, Mr. Investigator. A Mason was surely the one who '
                    'cracked the Spire and let the Blight in.'),
            ConvoCardLeft(convoText: 'Which one?'),
            ConvoCardRight(
                convoText: 'Who can say? Oh! I just had another '
                    'thought: Why do you care, anyway? Your people already told '
                    'us the "right" version of events. That means...this is your '
                    'own investigation! How exciting! Hmm...something '
                    'personal, very serious. You knew someone on that Spire, '
                    'didn\'t you?'),
            Container(
              child: Text(
                  '\n-- Thatcher\'s gaze never wavers, despite Michael\'s '
                  'taunting. Faced with a choice, he weighs '
                  'whether to threaten Michael with exposure for illegal '
                  'activities, or simply to tell him the truth. --\n',
                  style: kTextNarration),
            ),
          ]),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['The Truth', 'Threaten'],
      nextPageID: [29, 29]), // 28 >> 29, XX
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            Text('-- Thatcher decides to tell Michael the truth. --\n',
                style: kTextNarration),
            ConvoCardLeft(
                convoText: 'My son was on Spire 17. He was a doctor'
                    ' there.'),
            Text(
                '\n-- For a brief moment, Michael\'s face shows genuine '
                'sadness. His features become firm, and he sits up for the '
                'first time. --\n',
                style: kTextNarration),
            ConvoCardRight(
                convoText: 'I\'m sorry for your loss. You know, we Masons vow'
                    ' never to have children. More and more, I wish I had '
                    'taken a different path.'),
            ConvoCardLeft(
                convoText: 'Is that why you make a mockery of the Guild\'s '
                    'rules?'),
            ConvoCardRight(
                convoText: 'One of many reasons. It\'s also a lot '
                    'of fun.'),
            ConvoCardLeft(convoText: 'Alright, can you help?'),
            ConvoCardRight(
                convoText: 'My gut says that only Jeremiah could figure out '
                    'how to access the outer shell.'),
            ConvoCardLeft(convoText: 'What do you mean, access?'),
            ConvoCardRight(
                convoText: 'It\'s hard to explain how C-Max works, but the '
                    'biggest obstacle to using it is gaining access to it. '
                    'That is what separates the children who can be Masons. '
                    'We have to figure out how to access it without help.'),
            ConvoCardLeft(convoText: 'And once you have access...'),
            ConvoCardRight(
                convoText: 'The Guild trains us. But the outer shell is '
                    'different; no one has ever been able to access it before'
                    '. It\'s got a different set of rules, almost like a '
                    'different, ancient language.'),
            ConvoCardLeft(convoText: 'But you think Jeremiah could do it?'),
            ConvoCardRight(
                convoText: 'If anyone could, it would be him. He\'s a genius '
                    'among geniuses. Makes the rest of us look like children,'
                    ' really.'),
            ConvoCardLeft(convoText: 'Why would he do it?'),
            ConvoCardRight(
                convoText: 'I have no idea why anyone would do it, I just '
                    'think that Jeremiah could do it.'),
            ConvoCardLeft(convoText: 'What about Ricardo?'),
            Container(
              child: Text(
                  '\n-- Michael flinches at the name. His gaze wavers and he '
                  'looks down at the table for a moment. He quickly looks up,'
                  ' but his face is now intense and resolute. --\n',
                  style: kTextNarration),
            ),
            ConvoCardRight(
                convoText: 'No, he would never risk his own safety.'),
            ConvoCardLeft(
                convoText: 'You emphasized "own", what do you mean '
                    'by that?'),
            ConvoCardRight(
                convoText: '...nothing. It wasn\'t him, you just have to '
                    'trust me.'),
            Container(
              child: Text(
                  '\n-- Michael is visibly uncomfortable, but Thatcher does '
                  'believe him. Still, he could pull at this thread and '
                  'see what comes loose, or ask about Benjamin, the last '
                  'Mason. --\n',
                  style: kTextNarration),
            ),
          ]),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Pull the Thread', 'Benjamin'],
      nextPageID: [30, 30]), // 29 >> 30, XX
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            Text(
                '-- Thatcher decides to dig deeper into Michael and Ricardo'
                '\'s relationship. Michael shifts uncomfortably in Thatcher'
                '\'s silence, as if knowing the next question will be '
                'difficult for him. --'
                '\n',
                style: kTextNarration),
            ConvoCardLeft(convoText: 'What\'s the deal with you two?'),
            ConvoCardRight(
                convoText: 'He treated me horribly as an apprentice. Nothing '
                    'I did was ever right or good enough. He tried to mold me'
                    ' into a copy of himself, and when that didn\'t work, he'
                    '...'),
            Text(
                '-- Michael trails off and closes his eyes, attempting to '
                'regain his composure. Though slight, Thatcher notices that '
                'his posture slumps. He now looks weak and defensive. '
                'Thatcher knows this look. --',
                style: kTextNarration),
            ConvoCardLeft(convoText: 'He beat you.'),
            ConvoCardRight(
                convoText: 'Y--yeah. That\'s how it started, anyway. Over '
                    'time, he got more creative. He starved me, isolated me, '
                    'and when even that wasn\'t enough anymore, he found new '
                    'ways to satisfy his desires.'),
            ConvoCardLeft(convoText: 'No words, Michael. That\'s not right.'),
            ConvoCardRight(
                convoText: 'No one knew. When I finally became my own Mason, '
                    'he just dumped me into the world he kept me from for so '
                    'long. I had no idea how to behave.'),
            ConvoCardLeft(convoText: 'Can you prove any of this?'),
            ConvoCardRight(
                convoText: 'What\'s the point? Even if I could, he\'s a Mason'
                    '. He\'s untouchable.'),
            Text(
                '-- Thatcher thinks carefully about his next move, but '
                'decides that he has a moral obligation to tell Michael '
                'something he knows will hurt. --',
                style: kTextNarration),
            ConvoCardLeft(
                convoText: 'Listen, you need to go public with this'
                    '.'),
            ConvoCardRight(
                convoText: 'The Guild would never let me. Ernesto is gone, '
                    'one of us killed a whole Spire, and you want me to knock'
                    ' the shining light of the Guild off his pedestal? '
                    'Everything would fall apart.'),
            ConvoCardLeft(
                convoText: 'Then tell the Guild as soon as you can.'
                    ' Do it quietly, just do it soon.'),
            ConvoCardRight(convoText: 'Why? Why are you pushing this?'),
            ConvoCardLeft(
                convoText: 'Because the Guild just approved Ricardo'
                    ' to train a new apprentice. Ernesto needs to be rep--'),
            Text(
                '-- Michael shoots to his feet, both hands on the table. His '
                'eyes are filled with fear-tinged fury. --',
                style: kTextNarration),
            ConvoCardRight(convoText: 'What!? No, that--no!'),
            Text(
                '-- Michael bolts out of the booth and into the booming music'
                '. In his haste, he pushes patrons out of his way and '
                'disappears down the staircase. Thatcher sits a bit '
                'longer, hoping he made the right choice. --',
                style: kTextNarration),
            Text(
                'Well, at least he will do something. Hopefully spare '
                'another kid from that horrible fate.\n\n',
                style: kTextBody),
            Container(
              child: Text(
                  '\n-- Thatcher vows in his own mind that he will pursue '
                  'this matter after he finds the killer of Spire 17. The'
                  ' only thing to do now is find the dealer he promised '
                  'to identify. --\n',
                  style: kTextNarration),
            ),
          ]),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Continue'],
      nextPageID: [31]), // 30 >> 31
  //endregion
  //region D's Anger
  //endregion
  StoryPage(
      pageContents: [
        Container(
          alignment: Alignment.center,
          child: Text('START OVER'),
        )
      ],
      arcTitle: '',
      location: '',
      choices: ['Restart'],
      nextPageID: [0]), // TEMP END
  //endregion
];
//endregion

class StoryBrain {
  int _pageIndex = 30;
  Set<int> _storyRecap = userSave.getRecap();
  Set<int> _userLibrary = userSave.getLibrary();
  Set<String> _userSituations = userSave.getSituations();

  //region INFOBAR METHODS
  String getLocation() {
    return _storyData[_pageIndex].location;
  }

  String getArcTitle() {
    return _storyData[_pageIndex].arcTitle;
  }

  String getCurrentPage() {
    return _pageIndex > 0 ? _pageIndex.toString() : '';
  }
  //endregion

  //region      PAGE VIEW METHODS
  void turnPage(index) {
    addSituation();
    setNextPageIndex(index);
    getPageContents();
    saveGame();
  }

  List getPageContents() {
    List pageContents = _storyData[_pageIndex].pageContents;

    return pageContents;
  }

  List getChoices() {
    return _storyData[_pageIndex].choices;
  }

  int getSituationIndex(situation) {
    switch (situation) {
      case "gameInProgress":
        {
          return _storyRecap.length == 1 ? 1 : _storyRecap.last;
        }

      case "testSituation":
        {
          return 5;
        }
      case "restart":
        {
          restartGame();
          return 0;
        }

      default:
        {
          return 0;
        }
    }
  }

  Container getRecapPage(index) {
    Container recapPage = _storyData[index].pageContents[0];

    return recapPage;
  }

  List<Widget> getRecapContents() {
    List<Widget> recapContents = [];
    List storyRecap = _storyRecap.toList();
    storyRecap.toList();

    int length = storyRecap.length;
    for (int i = 0; i < length; i++) {
      int recapIndex = storyRecap[i];
      Container page = Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(child: getRecapPage(recapIndex)),
      );
      recapContents.add(page);
      print("recap: $storyRecap");
    }

    return recapContents;
  }

  void setNextPageIndex(int nextPageIndex) {
    if (_storyData[_pageIndex].checkSituation != null) {
      String situation = _storyData[_pageIndex].checkSituation!;
      _pageIndex = getSituationIndex(situation);
    } else {
      _pageIndex = _storyData[_pageIndex].nextPageID[nextPageIndex];
    }
  }

  List getPageIDs() {
    return _storyData[_pageIndex].nextPageID;
  }

  bool colorChoices(pageID) {
    if (pageID == 1 || pageID == 0) {
      return false;
    } else {
      return _userLibrary.contains(pageID);
    }
  }
  //endregion PAGEVIEW METHODS

  //region GAME METHODS
  void saveGame() {
    _storyRecap.add(_pageIndex);
    _userLibrary.add(_pageIndex);

    userSave.setRecap(_storyRecap.toList());
    userSave.setLibrary(_userLibrary.toList());
    userSave.setSituations(_userSituations.toList());
  }

  void restartGame() {
    _userSituations = {};
    _storyRecap = {0};
    userSave.setRecap(_storyRecap.toList());
    _pageIndex = 0;
  }

  void resetAll() {
    userSave.resetAll();
  }

  void addSituation() {
    if (_storyData[_pageIndex].addSituation != null) {
      _userSituations.add(_storyData[_pageIndex].addSituation!);
    }
  }
//endregion
}
