<template>
    <div :class="sidebarbg" class="app-sidebar sidebar-shadow"
         @mouseover="toggleSidebarHover('add','closed-sidebar-open')" @mouseleave="toggleSidebarHover('remove','closed-sidebar-open')">
        <div class="app-header__logo">
            <div class="logo-src" />
            <div class="header__pane ml-auto">
                <button type="button" class="hamburger close-sidebar-btn hamburger--elastic"
                        v-bind:class="{ 'is-active' : isOpen }" @click="toggleBodyClass('closed-sidebar')">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </button>
            </div>
        </div>
        <div class="app-sidebar-content">
            <VuePerfectScrollbar class="app-sidebar-scroll" v-once>
                <sidebar-menu showOneChild :menu="menu" @item-click="onItemClick" @toggle-collapse="onToggleCollapse"/>
            </VuePerfectScrollbar>
        </div>
    </div>
</template>

<script>
    import { SidebarMenu } from "vue-sidebar-menu";
    import VuePerfectScrollbar from "vue-perfect-scrollbar";
    import { mapGetters, mapActions } from "vuex"

    export default {
        components: {
            SidebarMenu,
            VuePerfectScrollbar
        },
        data() {
            return {
                prevRoute: null,
                lastRoute: null,
                isOpen: false,
                sidebarActive: false,
                menu: [
                    {
                        header: true,
                        title: "Main Navigation"
                    },
                    /*
                    {
                        href: "/dashboards/advertisement",
                        title: "Statistics",
                        icon: "pe-7s-graph2",
                    },
                    */
                    {
                        href: "/dashboards/users",
                        title: "Users",
                        icon: "pe-7s-user",
                        permissions: ['admin',]
                    },
                    /*
                    {
                        href: "/dashboards/campaigns",
                        title: "Campaigns",
                        icon: "pe-7s-browser",
                    },
                    */
                    {
                        title: "Campaigns",
                        icon: "pe-7s-browser",
                        child: [
                            {
                                title: "Companies",
                                href: '/dashboards/campaigns',
                            },
                            {
                                title: "Task templates",
                                href: '/dashboards/tasks-templates',
                            },
                        ]
                    },
                    /*
                    {
                        title: "Mailbox",
                        icon: "pe-7s-mail",
                        child: [
                            {
                                title: "one@mail.ru",
                                href: '/apps/mail',
                            },
                        ]
                    },
                    {
                        href: "/apps/chat",
                        title: "Chat",
                        icon: "pe-7s-chat",
                    },
                    {
                        header: true,
                        title: "UI Components"
                    },
                    {
                        icon: "pe-7s-diamond",
                        title: "Elements",
                        child: [
                            {
                                title: "Buttons",
                                child: [
                                    {
                                        title: "Standard",
                                        href: "/elements/buttons-standard"
                                    },
                                    {
                                        title: "Pills",
                                        href: "/elements/buttons-pills"
                                    },
                                    {
                                        title: "Square",
                                        href: "/elements/buttons-square"
                                    },
                                    {
                                        title: "Shadow",
                                        href: "/elements/buttons-shadow"
                                    },
                                    {
                                        title: "With Icons",
                                        href: "/elements/buttons-icons"
                                    }
                                ]
                            },
                            {
                                title: "Dropdowns",
                                href: "/elements/dropdowns"
                            },
                            {
                                title: "Icons",
                                href: "/elements/icons"
                            },
                            {
                                title: "Badges",
                                href: "/elements/badges-labels"
                            },
                            {
                                title: "Cards",
                                href: "/elements/cards"
                            },
                            {
                                title: "Loading Indicators",
                                href: "/elements/loaders"
                            },
                            {
                                title: "List Groups",
                                href: "/elements/list-group"
                            },
                            {
                                title: "Navigation Menus",
                                href: "/elements/navigation"
                            },
                            {
                                title: "Timeline",
                                href: "/elements/timelines"
                            },
                            {
                                title: "Utilities",
                                href: "/elements/utilities"
                            }
                        ]
                    },
                    {
                        icon: "pe-7s-car",
                        title: "Components",
                        child: [
                            {
                                title: "Tabs",
                                href: "/components/tabs"
                            },
                            {
                                title: "Accordions",
                                href: "/components/accordions"
                            },
                            {
                                title: "Sweet Alerts",
                                href: "/components/swal-alerts"
                            },
                            {
                                title: "Modals",
                                href: "/components/modals"
                            },
                            {
                                title: "Progress Bar",
                                href: "/components/progress-bar"
                            },
                            {
                                title: "Tooltips & Popovers",
                                href: "/components/tooltips-popovers"
                            },
                            {
                                title: "Carousel",
                                href: "/components/carousel"
                            },
                            {
                                title: "Calendar",
                                href: "/components/calendar"
                            },
                            {
                                title: "Pagination",
                                href: "/components/pagination"
                            },
                            {
                                title: "Count Up",
                                href: "/components/count-up"
                            },
                            {
                                title: "Scrollable",
                                href: "/components/scrollable-elements"
                            },
                            {
                                title: "Maps",
                                href: "/components/maps"
                            },
                            {
                                title: "Ratings",
                                href: "/components/ratings"
                            },
                            {
                                title: "Image Crop",
                                href: "/components/image-crop"
                            }
                        ]
                    },
                    {
                        icon: "pe-7s-display2",
                        title: "Tables",
                        child: [
                            {
                                title: "Regular Tables",
                                href: "/tables/regular-tables",
                            },
                            {
                                title: "Dynamic Tables",
                                href: "/tables/dynamic-tables",
                            }
                        ]
                    }
                    */
                ],

                windowWidth: 0
            };
        },
        props: {
            sidebarbg: String
        },
        watch: {
            $route(to, from) {
                //console.log(to, from)
                this.prevRoute = to
                this.lastRoute = from
            }
        },
        beforeRouteUpdate (to, from, next) {
            //console.log(to)
        },
        computed: {
            ...mapGetters(["profile",]),
        },
        methods: {
            ...mapActions([
            "readProfile",
            ]),
            onToggleCollapse(menu){
                //console.log(menu)
            },
            onItemClick(menu){
                let self = this
                //console.log(menu)
                //console.log("menu.toElement.baseURI", menu.toElement.baseURI)
                //console.log("menu.view.location.href", menu.view.location.href)
                //console.log("self.$route.path", self.$route.path)
                //console.log("this.prevRoute", this.prevRoute.hasOwnProperty("path") ? this.prevRoute.path : "/")
                //console.log("this.lastRoute", this.lastRoute.hasOwnProperty("path") ? this.lastRoute.path : "/")
                //console.log("window.location.href ", window.location.href )

                setTimeout(function(){
                /*
                console.log(localStorage.getItem("fromPath"))
                console.log(localStorage.getItem("toPath"))
                console.log("self.$route.path", self.$route.path)
                
                console.log("this.prevRoute", self.prevRoute.path)
                console.log("this.lastRoute", self.lastRoute.path)
                */
                    /*
                    if(this.prevRoute.path.includes(self.$route.path)){
                        console.log("Найден")
                        //self.$router.go(self.$router.currentRoute)
                    }else{
                        console.log("Не найден")
                    }
                    */
                }, 500)

                //console.log("vm.prevRoute", self.prevRoute)

                //console.log(menu.target.baseURI)
                //console.log(menu.view.location)
                //console.log(this.$route.path)
                //
                /*
                setTimeout(function(){
                    if(self.currentUrl.includes(self.$route.path)){
                        console.log("Найден")
                        //self.$router.go(self.$router.currentRoute)
                    }else{
                        console.log("Не найден")
                    }
                }, 500)
                */
                /*
                let self = this
                self.$router.push({ path: self.$route.path }).catch(()=>{
                    //self.$router.go(self.$router.currentRoute)
                })
                */
                //this.$router.push("/admin").catch(()=>{});
            },
            toggleBodyClass(className) {
                const el = document.body;
                this.isOpen = !this.isOpen;

                if (this.isOpen) {
                    el.classList.add(className);
                } else {
                    el.classList.remove(className);
                }
            },
            toggleSidebarHover(add, className) {
                const el = document.body;
                this.sidebarActive = !this.sidebarActive;

                this.windowWidth = document.documentElement.clientWidth;

                if (this.windowWidth > "992") {
                    if (add === "add") {
                        el.classList.add(className);
                    } else {
                        el.classList.remove(className);
                    }
                }
            },
            getWindowWidth() {
                const el = document.body;

                this.windowWidth = document.documentElement.clientWidth;

                if (this.windowWidth < "1350") {
                    el.classList.add("closed-sidebar", "closed-sidebar-md");
                } else {
                    el.classList.remove("closed-sidebar", "closed-sidebar-md");
                }
            }
        },
        mounted() {
            this.$nextTick(function() {
                window.addEventListener("resize", this.getWindowWidth);
                this.getWindowWidth();
            })
            //

            this.menu.forEach((item, index, menu)=>{
                if(item.hasOwnProperty("permissions")){
                    if(item.permissions.includes(this.profile.role)){

                    }else{
                        menu.splice(index, index - 1)
                    }
                    
                }
            })

            //console.log(this.menu, this.profile)
        },
        created(){},
        beforeDestroy() {
            window.removeEventListener("resize", this.getWindowWidth);
        }
    }
</script>
