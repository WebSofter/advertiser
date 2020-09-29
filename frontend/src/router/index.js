import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store';
Vue.use(Router);

let router = new Router({
    mode: 'history',
    //mode: 'hash',
    //hashbang: false,
    //history: true,
    //mode: 'html5',
    scrollBehavior() {
        return window.scrollTo({ top: 0, behavior: 'smooth' });
    },
    routes: [
        { 
            path: '*',
            name: '404', 
            component: () => import('../Pages/NotFound.vue')
        },
        // Dashboards
        {
            path: '/dashboards/users',
            name: 'users',
            component: () => import('../Pages/Users.vue'),
            meta: {
                crumbs: {
                    to: '/dashboards/users',
                },
                requireAuth : true,
            }
        },
        {
            path: '/dashboards/campaigns',
            name: 'campaigns',
            component: () => import('../Pages/Campaigns.vue'),
            //component: () => import('../DemoPages/Tables/DynamicTables.vue'),
            meta: {
                crumbs: {
                    to: '/dashboards/campaigns',
                },
                requireAuth : true,
            }
        },
        {
            path: '/dashboards/tasks-templates',
            name: 'tasks',
            component: () => import('../Pages/TaskTemplates.vue'),
            //component: () => import('../DemoPages/Tables/DynamicTables.vue'),
            meta: {
                crumbs: {
                    to: '/dashboards/tasks-templates',
                },
                requireAuth : true,
            }
        },
        {
            path: '/dashboards/campaigns/:companyId/tasks',
            name: 'tasks',
            component: () => import('../Pages/Tasks.vue'),
            //component: () => import('../DemoPages/Tables/DynamicTables.vue'),
            meta: {
                //layout: 'userpages',
                crumbs: {
                    to: '/dashboards/campaigns/:companyId',
                },
                requireAuth : true,
            }
        },
        {
            path: '/dashboards/campaigns/:companyId/tasks/:taskId/notes',
            name: 'tasks',
            component: () => import('../Pages/Notes.vue'),
            //component: () => import('../DemoPages/Tables/DynamicTables.vue'),
            meta: {
                //layout: 'userpages',
                crumbs: {
                    to: '/dashboards/campaigns/:conpanyId/tasks/:taskId',
                },
                requireAuth : true,
            }
        },
        {
            path: '/',
            name: 'analytics',
            component: () => import('../Pages/Campaigns.vue'),
            //component: () => import('../DemoPages/Dashboards/Analytics.vue'),
            meta: {
                //layout: 'userpages',
                crumbs: {
                    to: '/dashboards/campaigns/:conpanyId/tasks/:taskId',
                },
                requireAuth : true,
            }
        },
        {
            path: '/dashboards',
            name: 'analytics',
            component: () => import('../DemoPages/Dashboards/Analytics.vue'),
            //component: () => import('../Pages/Campaigns.vue'),
            meta: {
                //layout: 'userpages',
                crumbs: {
                    to: '/dashboards/campaigns/:conpanyId/tasks/:taskId',
                },
                requireAuth : true,
            }
        },
        {
            path: '/dashboards/advertisement',
            name: 'advertisement',
            component: () => import('../DemoPages/Dashboards/Advertisement.vue'),
            meta: {
                //layout: 'userpages',
                crumbs: {
                    to: '/dashboards/campaigns/:conpanyId/tasks/:taskId',
                },
                requireAuth : true,
            }
        },
        {
            path: '/dashboards/management',
            name: 'management',
            component: () => import('../DemoPages/Dashboards/Management.vue'),
            meta: {
                //layout: 'userpages',
                crumbs: {
                    to: '/dashboards/campaigns/:conpanyId/tasks/:taskId',
                },
                requireAuth : true,
            }
        },
        {
            path: '/dashboards/helpdesk',
            name: 'helpdesk',
            component: () => import('../DemoPages/Dashboards/Helpdesk.vue'),
        },
        {
            path: '/dashboards/monitoring',
            name: 'monitoring',
            component: () => import('../DemoPages/Dashboards/Monitoring.vue'),
        },
        {
            path: '/dashboards/crypto',
            name: 'crypto',
            component: () => import('../DemoPages/Dashboards/Crypto.vue'),
        },
        {
            path: '/dashboards/project-management',
            name: 'project-management',
            component: () => import('../DemoPages/Dashboards/ProjectManagement.vue'),
        },
        {
            path: '/dashboards/product',
            name: 'product',
            component: () => import('../DemoPages/Dashboards/Product.vue'),
        },
        {
            path: '/dashboards/statistics',
            name: 'statistics',
            component: () => import('../DemoPages/Dashboards/Statistics.vue'),
        },

        // Applications

        {
            path: '/apps/mailbox',
            name: 'mailbox',
            meta: { layout: 'apps' },
            component: () => import('../DemoPages/Applications/Mailbox.vue'),
        },
        {
            path: '/apps/mail',
            name: 'mailbox',
            component: () => import('../DemoPages/Applications/Mailbox.vue'),
        },
        {
            path: '/apps/chat',
            name: 'chat',
            component: () => import('../DemoPages/Applications/Chat.vue'),
        },
        {
            path: '/apps/forums-listing',
            name: 'forums-listing',
            component: () => import('../DemoPages/Applications/ForumsListing.vue'),
        },
        {
            path: '/apps/forums-threads',
            name: 'forums-threads',
            component: () => import('../DemoPages/Applications/ForumsThreads.vue'),
        },
        {
            path: '/apps/forums-discussion',
            name: 'forums-discussion',
            component: () => import('../DemoPages/Applications/ForumsDiscussion.vue'),
        },

        // Pages
        /*
        {
            path: '/pages/login',
            name: 'login',
            meta: { layout: 'userpages' },
            component: () => import('../DemoPages/UserPages/Login.vue'),
        },
        */
        {
            path: '/pages/login',
            name: 'login',
            //component: () => import('../DemoPages/UserPages/LoginBoxed.vue'),
            component: () => import('../Pages/LoginBoxed.vue'),
            meta: {
                layout: 'userpages',
                crumbs: {
                    to: '/dashboards/campaigns/:conpanyId/tasks/:taskId',
                },
                requireAuth : false,
            }
        },
        /*
        {
            path: '/pages/register',
            name: 'register',
            meta: { layout: 'userpages' },
            component: () => import('../DemoPages/UserPages/Register.vue'),
        },
        */
        {
            path: '/pages/register-boxed',
            name: 'register-boxed',
            meta: { layout: 'userpages' },
            //component: () => import('../DemoPages/UserPages/RegisterBoxed.vue'),
            component: () => import('../Pages/RegisterBoxed.vue'),
        },
        {
            path: '/pages/forgot-password',
            name: 'forgot-password',
            meta: { layout: 'userpages' },
            component: () => import('../DemoPages/UserPages/ForgotPassword.vue'),
        },
        {
            path: '/pages/forgot-password-boxed',
            name: 'forgot-password-boxed',
            meta: { layout: 'userpages' },
            //component: () => import('../DemoPages/UserPages/ForgotPasswordBoxed.vue'),
            component: () => import('../Pages/ForgotPasswordBoxed.vue'),
        },

        // Elements

        {
            path: '/elements/buttons-standard',
            name: 'buttons-standard',
            component: () => import('../DemoPages/Elements/Buttons/Standard.vue'),
        },
        {
            path: '/elements/buttons-pills',
            name: 'buttons-pills',
            component: () => import('../DemoPages/Elements/Buttons/Pills.vue'),
        },
        {
            path: '/elements/buttons-square',
            name: 'buttons-square',
            component: () => import('../DemoPages/Elements/Buttons/Square.vue'),
        },
        {
            path: '/elements/buttons-shadow',
            name: 'buttons-shadow',
            component: () => import('../DemoPages/Elements/Buttons/Shadow.vue'),
        },
        {
            path: '/elements/buttons-icons',
            name: 'buttons-icons',
            component: () => import('../DemoPages/Elements/Buttons/Icons.vue'),
        },
        {
            path: '/elements/dropdowns',
            name: 'dropdowns',
            component: () => import('../DemoPages/Elements/Dropdowns.vue'),
        },
        {
            path: '/elements/icons',
            name: 'icons',
            component: () => import('../DemoPages/Elements/Icons.vue'),
        },
        {
            path: '/elements/badges-labels',
            name: 'badges',
            component: () => import('../DemoPages/Elements/Badges.vue'),
        },
        {
            path: '/elements/cards',
            name: 'cards',
            component: () => import('../DemoPages/Elements/Cards.vue'),
        },
        {
            path: '/elements/loaders',
            name: 'loaders',
            component: () => import('../DemoPages/Elements/LoadingIndicators.vue'),
        },
        {
            path: '/elements/list-group',
            name: 'list-group',
            component: () => import('../DemoPages/Elements/ListGroups.vue'),
        },
        {
            path: '/elements/navigation',
            name: 'navigation',
            component: () => import('../DemoPages/Elements/NavigationMenus.vue'),
        },
        {
            path: '/elements/timelines',
            name: 'timeline',
            component: () => import('../DemoPages/Elements/Timeline.vue'),
        },
        {
            path: '/elements/utilities',
            name: 'utilities',
            component: () => import('../DemoPages/Elements/Utilities.vue'),
        },

        // Components

        {
            path: '/components/tabs',
            name: 'tabs',
            component: () => import('../DemoPages/Components/Tabs.vue'),
        },
        {
            path: '/components/accordions',
            name: 'accordions',
            component: () => import('../DemoPages/Components/Accordions.vue'),
        },
        {
            path: '/components/notifications',
            name: 'notifications',
            component: () => import('../DemoPages/Components/Notifications.vue'),
        },
        {
            path: '/components/swal-alerts',
            name: 'notifications-swal',
            component: () => import('../DemoPages/Components/SwalAlerts.vue'),
        },
        {
            path: '/components/modals',
            name: 'modals',
            component: () => import('../DemoPages/Components/Modals.vue'),
        },
        {
            path: '/components/progress-bar',
            name: 'progress-bar',
            component: () => import('../DemoPages/Components/ProgressBar.vue'),
        },
        {
            path: '/components/tooltips-popovers',
            name: 'tooltips-popovers',
            component: () => import('../DemoPages/Components/TooltipsPopovers.vue'),
        },
        {
            path: '/components/carousel',
            name: 'carousel',
            component: () => import('../DemoPages/Components/Carousel.vue'),
        },
        {
            path: '/components/calendar',
            name: 'calendar',
            component: () => import('../DemoPages/Components/Calendar.vue'),
        },
        {
            path: '/components/pagination',
            name: 'pagination',
            component: () => import('../DemoPages/Components/Pagination.vue'),
        },
        {
            path: '/components/count-up',
            name: 'count-up',
            component: () => import('../DemoPages/Components/CountUp.vue'),
        },
        {
            path: '/components/scrollable-elements',
            name: 'scrollable-elements',
            component: () => import('../DemoPages/Components/Scrollable.vue'),
        },
        {
            path: '/components/maps',
            name: 'maps',
            component: () => import('../DemoPages/Components/Maps.vue'),
        },
        {
            path: '/components/ratings',
            name: 'ratings',
            component: () => import('../DemoPages/Components/Ratings.vue'),
        },
        {
            path: '/components/image-crop',
            name: 'image-crop',
            component: () => import('../DemoPages/Components/ImageCrop.vue'),
        },

        // Tables

        {
            path: '/tables/regular-tables',
            name: 'regular-tables',
            component: () => import('../DemoPages/Tables/RegularTables.vue'),
        },
        {
            path: '/tables/dynamic-tables',
            name: 'dynamic-tables',
            component: () => import('../DemoPages/Tables/DynamicTables.vue'),
        },

        // Dashboard Widgets

        {
            path: '/widgets/chart-boxes',
            name: 'chart-boxes',
            component: () => import('../DemoPages/Widgets/ChartBoxes1.vue'),
        },
        {
            path: '/widgets/chart-boxes-2',
            name: 'chart-boxes-2',
            component: () => import('../DemoPages/Widgets/ChartBoxes2.vue'),
        },
        {
            path: '/widgets/chart-boxes-3',
            name: 'chart-boxes-3',
            component: () => import('../DemoPages/Widgets/ChartBoxes3.vue'),
        },
        {
            path: '/widgets/profile-boxes',
            name: 'profile-boxes',
            component: () => import('../DemoPages/Widgets/ProfileBoxes.vue'),
        },

        // Forms

        {
            path: '/forms/controls',
            name: 'controls',
            component: () => import('../DemoPages/Forms/Elements/Controls.vue'),
        },
        {
            path: '/forms/layouts',
            name: 'layouts',
            component: () => import('../DemoPages/Forms/Elements/Layouts.vue'),
        },
        {
            path: '/forms/validation',
            name: 'validation',
            component: () => import('../DemoPages/Forms/Elements/Validation.vue'),
        },
        {
            path: '/forms/wizards',
            name: 'wizards',
            component: () => import('../DemoPages/Forms/Elements/Wizards.vue'),
        },
        {
            path: '/forms/sticky-headers',
            name: 'sticky-headers',
            component: () => import('../DemoPages/Forms/Elements/Sticky.vue'),
        },
        {
            path: '/forms/datepicker',
            name: 'datepicker',
            component: () => import('../DemoPages/Forms/Components/Datepicker.vue'),
        },
        {
            path: '/forms/range-slider',
            name: 'range-slider',
            component: () => import('../DemoPages/Forms/Components/RangeSlider.vue'),
        },
        {
            path: '/forms/input-selects',
            name: 'input-selects',
            component: () => import('../DemoPages/Forms/Components/InputSelects.vue'),
        },
        {
            path: '/forms/toggle-switch',
            name: 'toggle-switch',
            component: () => import('../DemoPages/Forms/Components/ToggleSwitch.vue'),
        },
        {
            path: '/forms/wysiwyg-editors',
            name: 'editors',
            component: () => import('../DemoPages/Forms/Components/Editors.vue'),
        },
        {
            path: '/forms/input-mask',
            name: 'input-mask',
            component: () => import('../DemoPages/Forms/Components/InputMask.vue'),
        },
        {
            path: '/forms/clipboard',
            name: 'clipboard',
            component: () => import('../DemoPages/Forms/Components/Clipboard.vue'),
        },
        {
            path: '/forms/textarea-autosize',
            name: 'textarea-autosize',
            component: () => import('../DemoPages/Forms/Components/TextareaAutosize.vue'),
        },
        {
            path: '/forms/colorpicker',
            name: 'colorpicker',
            component: () => import('../DemoPages/Forms/Components/Colorpicker.vue'),
        },
        {
            path: '/forms/dropzone',
            name: 'dropzone',
            component: () => import('../DemoPages/Forms/Components/Dropzone.vue'),
        },

        // Charts

        {
            path: '/charts/chartjs',
            name: 'chartjs',
            component: () => import('../DemoPages/Charts/Chartjs.vue'),
        },
        {
            path: '/charts/apexcharts',
            name: 'apexcharts',
            component: () => import('../DemoPages/Charts/ApexCharts.vue'),
        },
        {
            path: '/charts/gauges',
            name: 'gauges',
            component: () => import('../DemoPages/Charts/Gauges.vue'),
        },
        {
            path: '/charts/sparklines',
            name: 'sparklines',
            component: () => import('../DemoPages/Charts/Sparklines.vue'),
        },

        {
            path: '/material-components/alerts',
            name: 'alerts',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/alerts.vue'),
        },
        {
            name: 'avatars',
            path: '/material-components/avatars',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/avatars.vue'),

        },
        {
            name: 'badges-mat',
            path: '/material-components/badges',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/badges.vue'),

        },
        {
            name: 'bottom-navigation',
            path: '/material-components/bottom-navigation',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/bottom-navigation.vue'),

        },
        {
            name: 'bottom-sheets',
            path: '/material-components/bottom-sheets',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/bottom-sheets.vue'),

        },
        {
            name: 'breadcrumbs',
            path: '/material-components/breadcrumbs',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/breadcrumbs.vue'),

        },
        {
            name: 'buttons',
            path: '/material-components/buttons',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/buttons.vue'),
        },
        {
            name: 'calendars',
            path: '/material-components/calendars',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/calendars.vue'),
        },
        {
            name: 'cards-mat',
            path: '/material-components/cards',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/cards.vue'),
        },
        {
            name: 'carousels-mat',
            path: '/material-components/carousels',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/carousels.vue'),
        },
        {
            name: 'chips',
            path: '/material-components/chips',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/chips.vue'),
        },
        {
            name: 'data-iterator',
            path: '/material-components/data-iterator',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/data-iterator.vue'),
        },
        {
            name: 'data-tables',
            path: '/material-components/data-tables',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/data-tables.vue'),
        },
        {
            name: 'dialogs',
            path: '/material-components/dialogs',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/dialogs.vue'),
        },
        {
            name: 'dividers',
            path: '/material-components/dividers',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/dividers.vue'),
        },
        {
            name: 'expansion-panels',
            path: '/material-components/expansion-panels',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/expansion-panels.vue'),
        },
        {
            name: 'footer',
            path: '/material-components/footer',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/footer.vue'),
        },
        {
            name: 'groups',
            path: '/material-components/groups',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/groups.vue'),
        },
        {
            name: 'hover',
            path: '/material-components/hover',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/hover.vue'),
        },
        {
            name: 'icons-mat',
            path: '/material-components/icons',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/icons.vue'),
        },
        {
            name: 'images',
            path: '/material-components/images',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/images.vue'),
        },
        {
            name: 'autocompletes',
            path: '/material-components/autocompletes',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/autocompletes.vue'),
        },
        {
            name: 'combobox',
            path: '/material-components/combobox',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/combobox.vue'),
        },
        {
            name: 'forms',
            path: '/material-components/forms',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/forms.vue'),
        },
        {
            name: 'selects',
            path: '/material-components/selects',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/selects.vue'),
        },
        {
            name: 'selection-controls',
            path: '/material-components/selection-controls',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/selection-controls.vue'),
        },
        {
            name: 'sliders',
            path: '/material-components/sliders',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/sliders.vue'),
        },
        {
            name: 'textareas',
            path: '/material-components/textareas',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/textareas.vue'),
        },
        {
            name: 'text-fields',
            path: '/material-components/text-fields',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/text-fields.vue'),
        },
        {
            name: 'lists',
            path: '/material-components/lists',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/lists.vue'),
        },
        {
            name: 'menus',
            path: '/material-components/menus',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/menus.vue'),
        },
        {
            name: 'navigation-drawers',
            path: '/material-components/navigation-drawers',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/navigation-drawers.vue'),
        },
        {
            name: 'paginations',
            path: '/material-components/paginations',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/paginations.vue'),
        },
        {
            name: 'parallax',
            path: '/material-components/parallax',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/parallax.vue'),
        },
        {
            name: 'datepickers',
            path: '/material-components/datepickers',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/datepickers.vue'),
        },
        {
            name: 'timepickers',
            path: '/material-components/timepickers',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/timepickers.vue'),
        },
        {
            name: 'progress',
            path: '/material-components/progress',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/progress.vue'),
        },
        {
            name: 'ratings-mat',
            path: '/material-components/ratings',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/ratings.vue'),
        },
        {
            name: 'sheets',
            path: '/material-components/sheets',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/sheets.vue'),
        },
        {
            name: 'snackbars',
            path: '/material-components/snackbars',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/snackbars.vue'),
        },
        {
            name: 'sparklines-mat',
            path: '/material-components/sparklines',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/sparklines.vue'),
        },
        {
            name: 'steppers',
            path: '/material-components/steppers',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/steppers.vue'),
        },
        {
            name: 'subheaders',
            path: '/material-components/subheaders',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/subheaders.vue'),
        },
        {
            name: 'tabs-mat',
            path: '/material-components/tabs',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/tabs.vue'),
        },
        {
            name: 'timelines',
            path: '/material-components/timelines',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/timelines.vue'),
        },
        {
            name: 'toolbars',
            path: '/material-components/toolbars',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/toolbars.vue'),
        },
        {
            name: 'tooltips',
            path: '/material-components/tooltips',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/tooltips.vue'),
        },
        {
            name: 'treeview',
            path: '/material-components/treeview',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/treeview.vue'),
        },
        {
            name: 'ripples',
            path: '/material-components/ripples',
            component: () => import('../DemoPages/Vuetify/ComponentsPages/ripples.vue'),
        },

    ]
})

/*
router.beforeEach((to, from, next) => {
  //console.log("to", to)
  //console.log("from", from)
  localStorage.setItem("fromPath", from.path)
  localStorage.setItem("toPath", to.path)
  if (to.matched.some(record => record.meta.requireAuth)) {

    if (!store.getters.loggedIn) {
        next({
            path: '/pages/login',
            params: { nextUrl: to.fullPath },
        })
    } else {
      next() // go to wherever I'm going
    }
  } else {
    next() // does not require auth, make sure to always call next()!
  }
})
*/
//router.beforeEach((to, from, next) => {})
/*
router.beforeEach((to, from, next) => {
    if(to.matched.some(record => record.meta.requireAuth)) {
        if (localStorage.getItem('loggedIn')) {
            next() 
        } else {
            next({
                path: '/pages/login',
                params: { nextUrl: to.fullPath }
            })
        }
    } else {
        next() 
    }
})
*/
export default router
