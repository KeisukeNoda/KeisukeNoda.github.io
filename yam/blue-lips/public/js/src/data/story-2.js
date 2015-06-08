var expressions = {
    img1: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['surprised'],
        phrase: 'Be in awe - just saw jesus.',
        image: '/images/img1.png'
    },
    img2: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['surprised', 'happy'],
        phrase: 'you do not approve of what is happening',
        image: '/images/img2.png'
    },
    img3: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['happy', 'surprised'],
        phrase: 'you\'re at the dentist - show your teeth',
        image: '/images/img3.png'
    },
    img4: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: [],
        phrase: 'eager',
        image: '/images/img4.png'
    },
    img5: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['happy'],
        phrase: 'glee',
        image: '/images/img5.png'
    },
    img6: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['happy'],
        phrase: 'more glee',
        image: '/images/img6.png'
    },
    img65: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: [],
        phrase: 'you are bored',
        image: '/images/img10.png'
    },
    img7: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['surprised', 'happy'],
        phrase: 'You are disgusted',
        image: '/images/img7.png'
    },
    img8: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['surprised', 'happy'],
        phrase: 'pure delight!',
        image: '/images/img8.png'
    },
    img9: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['sad'],
        phrase: 'nothing affects you anymore',
        image: '/images/img9.png'
    },
    img10: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['sad'],
        phrase: 'You are a rock with shifty eyes',
        image: '/images/img10.png'
    },
    img11: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['happy'],
        phrase: 'You are a panting dog',
        image: '/images/img11.png'
    },
    img12: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['angry'],
        phrase: 'deadpan exhaustion',
        image: '/images/img12.png'
    },
    img13: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['angry'],
        phrase: '++ sigh out loud for bonus points ++',
        image: '/images/img13.png'
    },
    img14: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: [],
        phrase: 'ah whatever',
        image: '/images/img14.png'
    },
    img15: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['surprised', 'happy', 'sad'],
        phrase: 'Does it smell like popcorn?',
        image: '/images/img15.png'
    },
    img16: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: [],
        phrase: 'Oh well... not popcorn.',
        image: '/images/img16.png'
    },
    img17: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['surprised'],
        phrase: 'I think I might be getting hypnotized..',
        image: '/images/img17.png'
    },
    img18: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['angry'],
        phrase: 'My life depends on reading this sentence',
        image: '/images/img18.png'
    },
    img19: {
        emotions: {
            angry: 1,
            sad: 1,
            surprised: 1,
            happy: 1
        },
        templates: ['happy', 'sad'],
        phrase: 'bemused smile',
        image: '/images/img19.png'
    }
};

var data = {
    name: '/welcome/2',
    audio: '/audio/filmSpiritual.mp3',
    colors: {
        '3.0':'ef7e6f',
        '4.0':'f99e7a',
        '5.0':'ffb594',
        '10.0':'ff4e00', //red
        '15.0':'9b390d', //brown
        '19.0':'e8e8e8', //grey
        '21.0':'7a7b7f', //dark grey
        '24.0':'000000', //black
        '26.0':'ff3386', //pink
        '30.0':'ffa6ca', //light pink
        '30.3':'ffc0da',
        '30.8':'ffd7e7',
        '31.2':'fff0f6',
        '31.6':'f0fffa',
        '32.0':'defff3',
        '32.4':'caffec',
        '33.0':'c60e0e', //deep red
        '37.0':'f25151', //lighter red
        '41.0':'f4d9c3', //tan
        '46.0':'05034c', //midnight blue
        '46.8':'121075',
        '47.4':'361c93',
        '48.2':'4034b7',
        '49.0':'733ec6', //
        '49.7':'a23ec6',
        '50.3':'ce56db',
        '50.9':'e86dce',
        '51.6':'e86da5',
        '52.3':'e86d7c', //
        '53.0':'f47878',
        '53.6':'f46c31',
        '54.1':'ff6e0b',
        '55.0':'ffc197', //light orange
        '56.0':'ffd9b0',
        '57.0':'ffe7b0',
        '58.0':'fff5ca',
        '60.0':'3b0a66', //deep purple, stard fade in out
        '60.0':'56168e',
        '61.0':'732eaf',
        '62.0':'914ecc',
        '62.5':'b27ee0',
        '63.0':'d6b0f7',
        '63.5':'edd9ff',
        '64.0':'ffffff', //white...

        '64.3':'d9d9ff',
        '64.6':'c5c5ff',
        '64.9':'a1a1ff',
        '65.2':'7171ff',
        '65.5':'4747fc',
        '65.8':'1c1cf9',
        '66.0':'0000dd', //peak blue

        '66.1':'1c1cf9',
        '66.2':'4747fc',
        '66.4':'7171ff',
        '66.6':'a1a1ff',
        '66.8':'c5c5ff',
        '66.9':'d9d9ff',

        '67.0':'3b0a66', //white...

        '67.3':'d9d9ff',
        '67.6':'c5c5ff',
        '67.9':'a1a1ff',
        '68.3':'7171ff',
        '68.6':'4747fc',
        '69.0':'3b0a66', //peak green

        '69.1':'4747fc',
        '69.2':'7171ff',
        '69.4':'a1a1ff',
        '69.6':'c5c5ff',
        '69.8':'d9d9ff',

        '70.0':'3b0a66', //white...

        '70.3':'ffdefb',
        '70.6':'ffb8f7',
        '70.9':'ff83f0',
        '71.3':'ff61ec',
        '71.6':'ff36e7',
        '72.0':'f906dd', //peak pink


        '72.1':'ff36e7',
        '72.2':'ff61ec',
        '72.4':'ff83f0',
        '72.6':'ffb8f7',
        '72.8':'ffdefb',

        '73.0':'3b0a66', //white...

        '73.3':'ffe1d2',
        '73.5':'f9c2a7',
        '73.8':'ffa87d',
        '74.2':'fc8449',
        '74.4':'ff681d',
        '74.6':'f45100', //on way to peak orange

        '75.0':'ffffff', //jaded (white)

        '79.0':'a1ebff', //light blue
        '81.0':'c7f1ff',
        '84.0':'e1f7ff',
        '87.0':'ffffff',

        '89.0':'ddffd2', //light green
        '90.5':'bbe2af',

        '95.0':'000000', //black

        '104.0':'111111',
        '105.0':'222222',
        '105.5':'333333',
        '106.0':'444444',
        '106.5':'555555',
        '107.0':'666666',
        '107.5':'777777',
        '108.0':'999999',
        '108.5':'aaaaaa',
        '109.0':'bbbbbb',
        '109.8':'cccccc',
        '110.4':'dddddd',
        '111.1':'eeeeee',
        '112.0':'ffffff',
    },
    expressions: {
        '0.0':expressions.img1,
        '10.0':expressions.img2,
        '15.0':expressions.img3,
        '19.0':expressions.img4,
        '21.0':expressions.img5,
        '24.0':expressions.img6,
        '26.0':expressions.img65,
        '30.0':expressions.img7,
        '33.0':expressions.img8,
        '41.0':expressions.img9,
        '46.0':expressions.img10,
        '55.0':expressions.img11,
        '60.0':expressions.img12,
        '66.0':expressions.img13,
        '75.0':expressions.img14,
        '79.0':expressions.img15,
        '89.0':expressions.img16,
        '95.0':expressions.img17,
        '100.0':expressions.img18,
        '104.0':expressions.img19,
    }
};
