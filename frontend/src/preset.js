import conf from './configuration'

const preset = {
    task: {
        status: [
            {
                name: "Active",
                text: "Active",
                value: 1,
            },
            {
                name: "Freeze",
                text: "Freeze",
                value: 2,
            },
            {
                name: "Finish",
                text: "Finish",
                value: 3,
            },
        ],
        autoJoin: [
            {
                name: "Yes",
                text: "Yes",
                value: true,
            },
            {
                name: "No",
                text: "No",
                value: false,
            }
        ],
    },
    company: {
        status: [
            {
                name: "Public",
                text: "Public",
                value: 1,
            },
            {
                name: "Private",
                text: "Private",
                value: 2,
            },
            {
                name: "Protected",
                text: "Protected",
                value: 3,
            }
        ],
        theme: [
            {
                name: "Finance",
                text: "Finance",
                value: 1,
            },
            {
                name: "IT",
                text: "IT",
                value: 2,
            },
            {
                name: "Develop",
                text: "Develop",
                value: 3,
            },
            {
                name: "Building",
                text: "Building",
                value: 4,
            }
        ]
    },
    user: {
        default: {
            user_pic : {
                male: conf.url + '/media/user_pic_male.png',
                female: conf.url + '/media/user_pic_female.png',
            }
        },
        gender: [
            {
                name: "Male",
                text: "Male",
                value: 1,
            },
            {
                name: "Female",
                text: "Female",
                value: 2,
            }
        ],
        status: [
            {
                name: "Blocked",
                text: "Blocked",
                value: 0,
            },
            {
                name: "Active",
                text: "Active",
                value: 1,
            },
            {
                name: "Limited",
                text: "Limited",
                value: 2,
            },
        ],
        role: [
            {
                name: "Admin",
                text: "Admin",
                value: 'admin',
            },
            {
                name: "User",
                text: "User",
                value: 'user',
            },
        ]
    }

}

preset.getName = function(preset, value){
    try{
        return value === undefined ? null : (preset.filter(e => e.value == value))[0].name
    }catch(e){
        //console.error(e)
        return value
    }
}


export default preset