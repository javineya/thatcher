import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:thatcher/resources/constants.dart';
import '../database/story_page.dart';
import '../config/config.dart';

// TODO implement repeat dead-end protection feature
// TODO FIX RECAP SCROLL OVERFLOW

//region STORY DATA
List<StoryPage> _storyData = [
  //region INTRO
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
                    'Gotta stay quiet about it. Focus! If C-Max is involved, '
                    'had to be a Mason. Talk to Theo, get info on the '
                    'Masons.\n\n',
              ),
              TextSpan(
                style: kTextNarration,
                text: '-- Thatcher sits at his terminal and begins '
                    'hammering out a message. --',
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
                      '\' The Broken Tail\'. I believe you have had dealings there '
                      'in  the past. \n\n'
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
    // TODO add arcs here as they are created
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
    // TODO add arcs here as they are created
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
    // TODO add arcs here as they are created
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
    // TODO add arcs here as they are created
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
    // TODO add arcs here as they are created
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
    // TODO add arcs here as they are created
    choices: ['The Urn', 'The Degree', 'The Award', 'Wait for Theo'],
    nextPageID: [13, 14, 15, 5],
  ), // Guitar  16 >> 13,14,15,5
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
      nextPageID: [0]) // START OVER
  //endregion
];
//endregion

//region TEST DATA
// List<StoryPage> _storyData = [
//   StoryPage(
//     location: '',
//     arcTitle: '',
//     pageContents: [
//       Container(
//         child: Text.rich(
//           TextSpan(
//             text: 'Test Data\n\n',
//             children: <TextSpan>[
//               TextSpan(text: 'Subtitle Text\n\n'),
//               TextSpan(text: 'by JesterVae'),
//             ],
//           ),
//           textAlign: TextAlign.center,
//         ),
//       )
//     ],
//     choices: ['Continue'],
//     addSituation: 'gameInProgress',
//     checkSituation: 'gameInProgress',
//     nextPageID: [1],
//   ), // 0 >> 1, 5
//   StoryPage(
//     location: '',
//     arcTitle: 'Prologue',
//     pageContents: [
//       Container(
//         child: Text.rich(
//             TextSpan(
//               text: '“Title Text”\n More Title Text\n\n',
//               children: <TextSpan>[
//                 TextSpan(
//                   text:
//                       '\t\tIndent with 2 tabs? \n\t\t Newline 2 tabs for joined '
//                       'paragraph. \n\n\t\t 2 newlines 2 tabs for separated text.',
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.center),
//       )
//     ],
//     choices: ['Page 3', 'Page 2'],
//     nextPageID: [3, 2],
//   ), // 1 >> 2, 3
//   StoryPage(
//       location: '',
//       arcTitle: 'Prologue',
//       pageContents: [
//         Container(
//           child: Text.rich(
//             TextSpan(
//               text: '-Narration!-\n'
//                   '\n',
//               children: <TextSpan>[
//                 TextSpan(text: 'Bullshit! '),
//                 TextSpan(
//                   text: 'More Text.\n\n',
//                 ),
//                 TextSpan(
//                   text: '-Narration style!-\n\n',
//                 ),
//                 TextSpan(
//                   text: 'Talking, talking.',
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.center,
//           ),
//         )
//       ],
//       choices: ['Choice'],
//       nextPageID: [3],
//       addSituation: 'testSituation',
//       checkSituation: 'testSituation'), // 2 >> 3 !4
//   StoryPage(
//       location: '',
//       arcTitle: 'Prologue',
//       pageContents: [
//         Container(
//           child: Column(
//             children: [
//               Text(
//                 '-You come to the end of the test database.-\n\n',
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.blueGrey,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Text(
//                     'TO: theUser@thatcher\n'
//                     'FR: theDeveloper@thatcher\n\n'
//                     'SB: Figure Out Message Background\n\n'
//                     'You want to have a message background. Make it work.',
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//       choices: ['Restart'],
//       nextPageID: [0],
//       addSituation: "restart",
//       checkSituation: "restart"), // 3 >> 0
//   StoryPage(
//       location: '',
//       arcTitle: 'Situation!',
//       pageContents: [
//         Container(
//           child: Text.rich(
//             TextSpan(
//               text: '-You successfully passed a situation!.-\n\n',
//               children: <TextSpan>[
//                 TextSpan(
//                   text: 'Now keep working!',
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.center,
//           ),
//         )
//       ],
//       choices: ['Restart'],
//       nextPageID: [0],
//       addSituation: "restart",
//       checkSituation: "restart"), // 4 >> 0
//   StoryPage(
//       location: '',
//       arcTitle: 'Continue Button Test!',
//       pageContents: [
//         Container(
//           child: Text.rich(
//             TextSpan(
//               text: 'If you did it right, you will see this page.-\n\n',
//               children: <TextSpan>[
//                 TextSpan(
//                   text: 'Excellent! Now keep working!',
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.center,
//           ),
//         )
//       ],
//       choices: ['Restart'],
//       nextPageID: [0],
//       addSituation: "restart",
//       checkSituation: "restart"), // 5 >> 0
// ];
//endregion

class StoryBrain {
  Box prefsBox = Hive.box("preferences");
  Box userSavedBox = Hive.box("userSave");
  int _pageIndex = 0;
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
    List storyRecap = userSavedBox.get("recap") ?? [0];
    storyRecap.toList();

    int length = storyRecap.length;
    for (int i = 0; i < length; i++) {
      int recapIndex = storyRecap[i];
      Container page = Container(
        alignment: Alignment.center,
        child: getRecapPage(recapIndex),
      );
      recapContents.add(page);
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
  //endregion METHODS

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
    userSavedBox.put("recap", [0]);
    _storyRecap = {0};
    _pageIndex = 0;
  }

  void deleteAll() {
    userSavedBox.clear();
  }

  void addSituation() {
    if (_storyData[_pageIndex].addSituation != null) {
      _userSituations.add(_storyData[_pageIndex].addSituation!);
    }
  }
//endregion
}
