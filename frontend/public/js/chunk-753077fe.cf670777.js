(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-753077fe"],{"1a01":function(t,a,s){"use strict";var i=function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("div",{staticClass:"app-page-title"},[s("div",{staticClass:"page-title-wrapper"},[s("div",{staticClass:"page-title-heading"},[s("div",{staticClass:"page-title-icon"},[s("i",{class:t.icon})]),s("div",[t._v(" "+t._s(t.heading)+" "),s("div",{staticClass:"page-title-subheading"},[t._v(t._s(t.subheading))])])]),s("div",{staticClass:"page-title-actions"},[s("button",{staticClass:"btn-shadow d-inline-flex align-items-center btn btn-success",attrs:{type:"button"}},[s("font-awesome-icon",{staticClass:"mr-2",attrs:{icon:"plus"}}),t._v("Create New ")],1)])])])},e=[],n=s("ecee"),r=s("c074"),o=s("ad3d");n["c"].add(r["X"],r["R"]);var l={components:{"font-awesome-icon":o["a"]},props:{icon:String,heading:String,subheading:String}},c=l,u=s("2877"),d=Object(u["a"])(c,i,e,!1,null,null,null);a["a"]=d.exports},"1a23":function(t,a,s){"use strict";s.r(a),s.d(a,"CountUp",(function(){return e}));var i=function(){return(i=Object.assign||function(t){for(var a,s=1,i=arguments.length;s<i;s++)for(var e in a=arguments[s])Object.prototype.hasOwnProperty.call(a,e)&&(t[e]=a[e]);return t}).apply(this,arguments)},e=function(){function t(t,a,s){var e=this;this.target=t,this.endVal=a,this.options=s,this.version="2.0.5",this.defaults={startVal:0,decimalPlaces:0,duration:2,useEasing:!0,useGrouping:!0,smartEasingThreshold:999,smartEasingAmount:333,separator:",",decimal:".",prefix:"",suffix:""},this.finalEndVal=null,this.useEasing=!0,this.countDown=!1,this.error="",this.startVal=0,this.paused=!0,this.count=function(t){e.startTime||(e.startTime=t);var a=t-e.startTime;e.remaining=e.duration-a,e.useEasing?e.countDown?e.frameVal=e.startVal-e.easingFn(a,0,e.startVal-e.endVal,e.duration):e.frameVal=e.easingFn(a,e.startVal,e.endVal-e.startVal,e.duration):e.countDown?e.frameVal=e.startVal-(e.startVal-e.endVal)*(a/e.duration):e.frameVal=e.startVal+(e.endVal-e.startVal)*(a/e.duration),e.countDown?e.frameVal=e.frameVal<e.endVal?e.endVal:e.frameVal:e.frameVal=e.frameVal>e.endVal?e.endVal:e.frameVal,e.frameVal=Math.round(e.frameVal*e.decimalMult)/e.decimalMult,e.printValue(e.frameVal),a<e.duration?e.rAF=requestAnimationFrame(e.count):null!==e.finalEndVal?e.update(e.finalEndVal):e.callback&&e.callback()},this.formatNumber=function(t){var a,s,i,n,r,o=t<0?"-":"";if(a=Math.abs(t).toFixed(e.options.decimalPlaces),i=(s=(a+="").split("."))[0],n=s.length>1?e.options.decimal+s[1]:"",e.options.useGrouping){r="";for(var l=0,c=i.length;l<c;++l)0!==l&&l%3==0&&(r=e.options.separator+r),r=i[c-l-1]+r;i=r}return e.options.numerals&&e.options.numerals.length&&(i=i.replace(/[0-9]/g,(function(t){return e.options.numerals[+t]})),n=n.replace(/[0-9]/g,(function(t){return e.options.numerals[+t]}))),o+e.options.prefix+i+n+e.options.suffix},this.easeOutExpo=function(t,a,s,i){return s*(1-Math.pow(2,-10*t/i))*1024/1023+a},this.options=i(i({},this.defaults),s),this.formattingFn=this.options.formattingFn?this.options.formattingFn:this.formatNumber,this.easingFn=this.options.easingFn?this.options.easingFn:this.easeOutExpo,this.startVal=this.validateValue(this.options.startVal),this.frameVal=this.startVal,this.endVal=this.validateValue(a),this.options.decimalPlaces=Math.max(this.options.decimalPlaces),this.decimalMult=Math.pow(10,this.options.decimalPlaces),this.resetDuration(),this.options.separator=String(this.options.separator),this.useEasing=this.options.useEasing,""===this.options.separator&&(this.options.useGrouping=!1),this.el="string"==typeof t?document.getElementById(t):t,this.el?this.printValue(this.startVal):this.error="[CountUp] target is null or undefined"}return t.prototype.determineDirectionAndSmartEasing=function(){var t=this.finalEndVal?this.finalEndVal:this.endVal;this.countDown=this.startVal>t;var a=t-this.startVal;if(Math.abs(a)>this.options.smartEasingThreshold){this.finalEndVal=t;var s=this.countDown?1:-1;this.endVal=t+s*this.options.smartEasingAmount,this.duration=this.duration/2}else this.endVal=t,this.finalEndVal=null;this.finalEndVal?this.useEasing=!1:this.useEasing=this.options.useEasing},t.prototype.start=function(t){this.error||(this.callback=t,this.duration>0?(this.determineDirectionAndSmartEasing(),this.paused=!1,this.rAF=requestAnimationFrame(this.count)):this.printValue(this.endVal))},t.prototype.pauseResume=function(){this.paused?(this.startTime=null,this.duration=this.remaining,this.startVal=this.frameVal,this.determineDirectionAndSmartEasing(),this.rAF=requestAnimationFrame(this.count)):cancelAnimationFrame(this.rAF),this.paused=!this.paused},t.prototype.reset=function(){cancelAnimationFrame(this.rAF),this.paused=!0,this.resetDuration(),this.startVal=this.validateValue(this.options.startVal),this.frameVal=this.startVal,this.printValue(this.startVal)},t.prototype.update=function(t){cancelAnimationFrame(this.rAF),this.startTime=null,this.endVal=this.validateValue(t),this.endVal!==this.frameVal&&(this.startVal=this.frameVal,this.finalEndVal||this.resetDuration(),this.determineDirectionAndSmartEasing(),this.rAF=requestAnimationFrame(this.count))},t.prototype.printValue=function(t){var a=this.formattingFn(t);"INPUT"===this.el.tagName?this.el.value=a:"text"===this.el.tagName||"tspan"===this.el.tagName?this.el.textContent=a:this.el.innerHTML=a},t.prototype.ensureNumber=function(t){return"number"==typeof t&&!isNaN(t)},t.prototype.validateValue=function(t){var a=Number(t);return this.ensureNumber(a)?a:(this.error="[CountUp] invalid start or end value: "+t,null)},t.prototype.resetDuration=function(){this.startTime=null,this.duration=1e3*Number(this.options.duration),this.remaining=this.duration},t}()},"87f4":function(t,a,s){!function(a,i){t.exports=i(s("1a23"))}(0,(function(t){"use strict";var a,s=(a="Function",function(t){return Object.prototype.toString.call(t)==="[object ".concat(a,"]")}),i={__countup__:t.CountUp,name:"VueCountUp",props:{delay:{type:Number,required:!1,default:0},endVal:{type:Number,required:!0},options:{type:Object,required:!1}},data:function(){return{instance:null}},watch:{endVal:{handler:function(t){this.instance&&s(this.instance.update)&&this.instance.update(t)},deep:!1}},methods:{create:function(){var a=this;if(!a.instance){var s=a.$el,i=new t.CountUp(s,a.endVal,a.options);i.error||(a.instance=i,a.delay<0?a.$emit("ready",i,t.CountUp):setTimeout((function(){return i.start((function(){return a.$emit("ready",i,t.CountUp)}))}),a.delay))}},destroy:function(){this.instance=null},printValue:function(t){if(this.instance&&s(this.instance.printValue))return this.instance.printValue(t)},start:function(t){if(this.instance&&s(this.instance.start))return this.instance.start(t)},pauseResume:function(){if(this.instance&&s(this.instance.pauseResume))return this.instance.pauseResume()},reset:function(){if(this.instance&&s(this.instance.reset))return this.instance.reset()},update:function(t){if(this.instance&&s(this.instance.update))return this.instance.update(t)}},mounted:function(){this.create()},beforeDestroy:function(){this.destroy()}};return function(t,a){void 0===a&&(a={});var s=a.insertAt;if(t&&"undefined"!=typeof document){var i=document.head||document.getElementsByTagName("head")[0],e=document.createElement("style");e.type="text/css","top"===s&&i.firstChild?i.insertBefore(e,i.firstChild):i.appendChild(e),e.styleSheet?e.styleSheet.cssText=t:e.appendChild(document.createTextNode(t))}}(""),function(t,a,s,i,e,n,r,o,l,c){"boolean"!=typeof r&&(l=o,o=r,r=!1);var u,d="function"==typeof s?s.options:s;if(t&&t.render&&(d.render=t.render,d.staticRenderFns=t.staticRenderFns,d._compiled=!0,e&&(d.functional=!0)),i&&(d._scopeId=i),n?(u=function(t){(t=t||this.$vnode&&this.$vnode.ssrContext||this.parent&&this.parent.$vnode&&this.parent.$vnode.ssrContext)||"undefined"==typeof __VUE_SSR_CONTEXT__||(t=__VUE_SSR_CONTEXT__),a&&a.call(this,l(t)),t&&t._registeredComponents&&t._registeredComponents.add(n)},d._ssrRegister=u):a&&(u=r?function(){a.call(this,c(this.$root.$options.shadowRoot))}:function(t){a.call(this,o(t))}),u)if(d.functional){var p=d.render;d.render=function(t,a){return u.call(a),p(t,a)}}else{var h=d.beforeCreate;d.beforeCreate=h?[].concat(h,u):[u]}return s}({render:function(){var t=this.$createElement;return(this._self._c||t)("span")},staticRenderFns:[]},void 0,i,"data-v-0abbdf5a",!1,void 0,void 0,void 0)}))},c778:function(t,a,s){"use strict";s.r(a);var i=function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("div",[s("page-title",{attrs:{heading:t.heading,subheading:t.subheading,icon:t.icon}}),s("div",{staticClass:"row"},[s("div",{staticClass:"col-lg-6"},[s("div",{staticClass:"main-card mb-3 card"},[s("div",{staticClass:"card-body"},[s("h5",{staticClass:"card-title"},[t._v("Basic")]),s("h3",[s("span",{staticClass:"count-up-wrapper"},[s("ICountUp",{attrs:{startVal:t.startVal,endVal:t.endVal,decimals:t.decimals,duration:t.duration,options:t.options},on:{ready:t.onReady}})],1)])])])]),s("div",{staticClass:"col-lg-6"},[s("div",{staticClass:"main-card mb-3 card"},[s("div",{staticClass:"card-body"},[s("h5",{staticClass:"card-title"},[t._v("Numbers")]),s("div",{staticClass:"text-center"},[s("h3",[s("span",{staticClass:"count-up-wrapper-4"},[s("ICountUp",{attrs:{startVal:t.startVal,endVal:t.endVal,decimals:t.decimals,duration:t.duration,options:t.options},on:{ready:t.onReady}})],1)])])])])])]),s("div",{staticClass:"row"},[s("div",{staticClass:"col-md-4"},[s("div",{staticClass:"card mb-3 widget-chart"},[t._m(0),s("div",{staticClass:"widget-numbers"},[s("span",{staticClass:"count-up-wrapper-2"},[s("ICountUp",{attrs:{startVal:t.startVal,endVal:t.endVal,decimals:t.decimals,duration:t.duration,options:t.options},on:{ready:t.onReady}})],1)]),s("div",{staticClass:"widget-subheading"},[t._v("Total Views")]),s("div",{staticClass:"widget-description text-success"},[s("font-awesome-icon",{attrs:{icon:"angle-up"}}),t._m(1)],1)])]),s("div",{staticClass:"col-md-4"},[s("div",{staticClass:"card mb-3 widget-chart"},[t._m(2),s("div",{staticClass:"widget-numbers"},[s("span",{staticClass:"count-up-wrapper-2"},[s("ICountUp",{attrs:{startVal:t.startVal,endVal:t.endVal,decimals:t.decimals,duration:t.duration,options:t.options},on:{ready:t.onReady}})],1)]),s("div",{staticClass:"widget-subheading"},[t._v("Profiles")]),t._m(3)])]),s("div",{staticClass:"col-md-4"},[s("div",{staticClass:"card mb-3 widget-chart"},[t._m(4),s("div",{staticClass:"widget-numbers"},[s("span",{staticClass:"count-up-wrapper-2"},[s("ICountUp",{attrs:{startVal:t.startVal,endVal:t.endVal,decimals:t.decimals,duration:t.duration,options:t.options},on:{ready:t.onReady}})],1)]),s("div",{staticClass:"widget-subheading"},[t._v("Reports Submitted")]),s("div",{staticClass:"widget-description text-primary"},[s("span",{staticClass:"pr-1 count-up-wrapper-3"},[t._v("96 %")]),s("font-awesome-icon",{attrs:{icon:"angle-up"}})],1)])])])],1)},e=[function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("div",{staticClass:"icon-wrapper rounded-circle"},[s("div",{staticClass:"icon-wrapper-bg bg-primary"}),s("i",{staticClass:"lnr-cog text-primary"})])},function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("span",{staticClass:"pl-1"},[s("span",{staticClass:"count-up-wrapper-3"},[t._v("96 %")])])},function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("div",{staticClass:"icon-wrapper rounded-circle"},[s("div",{staticClass:"icon-wrapper-bg bg-success"}),s("i",{staticClass:"lnr-screen text-success"})])},function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("div",{staticClass:"widget-description text-warning"},[s("span",{staticClass:"pr-1"},[s("span",{staticClass:"count-up-wrapper-3"},[t._v("96 %")])])])},function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("div",{staticClass:"icon-wrapper rounded-circle"},[s("div",{staticClass:"icon-wrapper-bg bg-danger"}),s("i",{staticClass:"lnr-laptop-phone text-danger"})])}],n=s("1a01"),r=s("87f4"),o=s.n(r),l=s("ad3d"),c={components:{"font-awesome-icon":l["a"],PageTitle:n["a"],ICountUp:o.a},data:function(){return{heading:"Count Up",subheading:"Add animations to your numbers. It'll make your next Architect app more user friendly.",icon:"pe-7s-signal icon-gradient bg-malibu-beach",startVal:0,endVal:64,decimals:0,duration:5.5,options:{useEasing:!0,useGrouping:!0,separator:",",decimal:".",prefix:"",suffix:"k"}}},methods:{onReady:function(t){var a=this;t.update(a.endVal+100)}}},u=c,d=s("2877"),p=Object(d["a"])(u,i,e,!1,null,null,null);a["default"]=p.exports}}]);