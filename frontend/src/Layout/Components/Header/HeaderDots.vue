<template>
    <div class="header-dots">
        <b-dropdown toggle-class="p-0 mr-2" menu-class="dropdown-menu-xl" variant="link" no-caret right>
      <span slot="button-content">
        <div class="icon-wrapper icon-wrapper-alt rounded-circle">
          <div class="icon-wrapper-bg bg-danger"></div>
          <i class="nav-link-icon pe-7s-chat"></i>
          <div class="badge badge-dot badge-dot-sm badge-danger">Notifications</div>
        </div>
      </span>
            <div class="dropdown-menu-header mb-0">
                <div class="dropdown-menu-header-inner bg-deep-blue">
                    <div class="menu-header-image opacity-1 dd-header-bg-2"></div>
                    <div class="menu-header-content text-dark">
                        <h5 class="menu-header-title">New messages</h5>
                        <h6 class="menu-header-subtitle">
                            You have
                            <b>21</b> unread messages
                        </h6>
                    </div>
                </div>
            </div>
            <div class="nav-justified">
                <div class="card-header-tab-animation" card>
                    <div class="p-3">
                        <div class="scroll-gradient">
                            <div class="scroll-area-sm">
                                <VuePerfectScrollbar class="scrollbar-container" v-once>
                                    <div class="vertical-without-time vertical-timeline vertical-timeline--animate vertical-timeline--one-column">
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-success"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title">All Hands Meeting</h4>
                                                    <p> Lorem ipsum dolor sic amet, today at
                                                        <a href="javascript:void(0);">12:00 PM</a>
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-warning"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <p> Another meeting today, at
                                                        <b class="text-danger">12:00 PM</b>
                                                    </p>
                                                    <p> Yet another one, at
                                                        <span class="text-success">15:00 PM</span>
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-danger"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title">Build the production release</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amit,consectetur eiusmdd tempor incididunt
                                                        ut labore et dolore magna elit enim at minim veniam quis
                                                        nostrud
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-primary"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title text-success">Something not important</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amit,consectetur elit enim at minim veniam
                                                        quis nostrud
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-success"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title">All Hands Meeting</h4>
                                                    <p>
                                                        Lorem ipsum dolor sic amet, today at
                                                        <a href="javascript:void(0);">12:00 PM</a>
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-warning"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <p>
                                                        Another meeting today, at
                                                        <b class="text-danger">12:00 PM</b>
                                                    </p>
                                                    <p>
                                                        Yet another one, at
                                                        <span class="text-success">15:00 PM</span>
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-danger"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title">Build the production release</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amit,consectetur eiusmdd tempor incididunt
                                                        ut labore et dolore magna elit enim at minim veniam quis
                                                        nostrud
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-primary"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title text-success">Something not important</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amit,consectetur elit enim at minim veniam
                                                        quis nostrud
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </VuePerfectScrollbar>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item-divider nav-item mt-0"></li>
                    <li class="nav-item-btn text-center nav-item">
                        <button class="btn-shadow btn-wide btn-pill btn btn-focus btn-sm">View Latest Changes</button>
                    </li>
                </ul>
            </div>
        </b-dropdown>
        <b-dropdown toggle-class="p-0 mr-2" menu-class="dropdown-menu-xl" variant="link" no-caret right>
      <span slot="button-content">
        <div class="icon-wrapper icon-wrapper-alt rounded-circle">
          <div class="icon-wrapper-bg bg-danger"></div>
          <i class="nav-link-icon pe-7s-mail"></i>
          <div class="badge badge-dot badge-dot-sm badge-danger">Notifications</div>
        </div>
      </span>
            <div class="dropdown-menu-header mb-0">
                <div class="dropdown-menu-header-inner bg-deep-blue">
                    <div class="menu-header-image opacity-1 dd-header-bg-2"></div>
                    <div class="menu-header-content text-dark">
                        <h5 class="menu-header-title">New letters</h5>
                        <h6 class="menu-header-subtitle">
                            You have
                            <b>21</b> unread messages
                        </h6>
                    </div>
                </div>
            </div>
            <div class="nav-justified">
                <div class="card-header-tab-animation" card>
                    <div class="p-3">
                        <div class="scroll-gradient">
                            <div class="scroll-area-sm">
                                <VuePerfectScrollbar class="scrollbar-container" v-once>
                                    <div class="vertical-without-time vertical-timeline vertical-timeline--animate vertical-timeline--one-column">
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-success"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title">All Hands Meeting</h4>
                                                    <p> Lorem ipsum dolor sic amet, today at
                                                        <a href="javascript:void(0);">12:00 PM</a>
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-warning"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <p> Another meeting today, at
                                                        <b class="text-danger">12:00 PM</b>
                                                    </p>
                                                    <p> Yet another one, at
                                                        <span class="text-success">15:00 PM</span>
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-danger"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title">Build the production release</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amit,consectetur eiusmdd tempor incididunt
                                                        ut labore et dolore magna elit enim at minim veniam quis
                                                        nostrud
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-primary"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title text-success">Something not important</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amit,consectetur elit enim at minim veniam
                                                        quis nostrud
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-success"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title">All Hands Meeting</h4>
                                                    <p>
                                                        Lorem ipsum dolor sic amet, today at
                                                        <a href="javascript:void(0);">12:00 PM</a>
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-warning"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <p>
                                                        Another meeting today, at
                                                        <b class="text-danger">12:00 PM</b>
                                                    </p>
                                                    <p>
                                                        Yet another one, at
                                                        <span class="text-success">15:00 PM</span>
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-danger"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title">Build the production release</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amit,consectetur eiusmdd tempor incididunt
                                                        ut labore et dolore magna elit enim at minim veniam quis
                                                        nostrud
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-timeline-item vertical-timeline-element">
                                            <div>
                        <span class="vertical-timeline-element-icon bounce-in">
                          <i class="badge badge-dot badge-dot-xl badge-primary"></i>
                        </span>
                                                <div class="vertical-timeline-element-content bounce-in">
                                                    <h4 class="timeline-title text-success">Something not important</h4>
                                                    <p>
                                                        Lorem ipsum dolor sit amit,consectetur elit enim at minim veniam
                                                        quis nostrud
                                                    </p>
                                                    <span class="vertical-timeline-element-date"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </VuePerfectScrollbar>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item-divider nav-item mt-0"></li>
                    <li class="nav-item-btn text-center nav-item">
                        <button class="btn-shadow btn-wide btn-pill btn btn-focus btn-sm">View Latest Changes</button>
                    </li>
                </ul>
            </div>
        </b-dropdown>
    </div>
</template>

<script>
    import VuePerfectScrollbar from "vue-perfect-scrollbar";

    import { library } from "@fortawesome/fontawesome-svg-core";
    import { faArrowUp, faCog } from "@fortawesome/free-solid-svg-icons";

    library.add(faArrowUp, faCog);

    export default {
        components: {
            VuePerfectScrollbar,
        },
        data: () => ({}),
        methods: {}
    };
</script>

