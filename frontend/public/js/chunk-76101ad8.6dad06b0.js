(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-76101ad8"],{"0d97":function(t,a,e){"use strict";var i=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div",[t._t("default")],2)},s=[],n=e("2877"),l={},r=Object(n["a"])(l,i,s,!1,null,null,null);a["a"]=r.exports},"58df":function(t,a,e){"use strict";e.d(a,"a",(function(){return s}));var i=e("a026");function s(){for(var t=arguments.length,a=Array(t),e=0;e<t;e++)a[e]=arguments[e];return i["default"].extend({mixins:a})}},"6ac5":function(t,a,e){"use strict";e.r(a);var i=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div",[e("page-title",{attrs:{heading:t.heading,subheading:t.subheading}}),e("layout-wrapper",[e("demo-card",{attrs:{heading:"Basic",subheading:"A parallax causes a shift in a background image when the user scrolls the page."}},[e("parallax1")],1),e("demo-card",{attrs:{heading:"With content",subheading:"You can also place any content inside of the parallax. This allows you to use the parallax as a hero image."}},[e("parallax2")],1),e("demo-card",{attrs:{heading:"Custom height",subheading:"You can specify a custom height on a parallax. Keep in mind this can break the parallax if your image is not sized properly"}},[e("parallax3")],1)],1)],1)},s=[],n=e("8b1e"),l=e("0d97"),r=e("ad6b"),o=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("v-parallax",{attrs:{src:"https://cdn.vuetifyjs.com/images/parallax/material.jpg"}})},c=[],d=e("2877"),u=e("6544"),h=e.n(u),p=(e("fd71"),e("a026")),g=p["default"].extend({name:"translatable",props:{height:Number},data:function(){return{elOffsetTop:0,parallax:0,parallaxDist:0,percentScrolled:0,scrollTop:0,windowHeight:0,windowBottom:0}},computed:{imgHeight:function(){return this.objHeight()}},beforeDestroy:function(){window.removeEventListener("scroll",this.translate,!1),window.removeEventListener("resize",this.translate,!1)},methods:{calcDimensions:function(){var t=this.$el.getBoundingClientRect();this.scrollTop=window.pageYOffset,this.parallaxDist=this.imgHeight-this.height,this.elOffsetTop=t.top+this.scrollTop,this.windowHeight=window.innerHeight,this.windowBottom=this.scrollTop+this.windowHeight},listeners:function(){window.addEventListener("scroll",this.translate,!1),window.addEventListener("resize",this.translate,!1)},objHeight:function(){throw new Error("Not implemented !")},translate:function(){this.calcDimensions(),this.percentScrolled=(this.windowBottom-this.elOffsetTop)/(parseInt(this.height)+this.windowHeight),this.parallax=Math.round(this.parallaxDist*this.percentScrolled)}}}),f=e("58df"),m=Object(f["a"])(g).extend({name:"v-parallax",props:{alt:{type:String,default:""},height:{type:[String,Number],default:500},src:String},data:function(){return{isBooted:!1}},computed:{styles:function(){return{display:"block",opacity:this.isBooted?1:0,transform:"translate(-50%, "+this.parallax+"px)"}}},watch:{parallax:function(){this.isBooted=!0}},mounted:function(){this.init()},methods:{init:function(){var t=this,a=this.$refs.img;a&&(a.complete?(this.translate(),this.listeners()):a.addEventListener("load",(function(){t.translate(),t.listeners()}),!1))},objHeight:function(){return this.$refs.img.naturalHeight}},render:function(t){var a={staticClass:"v-parallax__image",style:this.styles,attrs:{src:this.src,alt:this.alt},ref:"img"},e=t("div",{staticClass:"v-parallax__image-container"},[t("img",a)]),i=t("div",{staticClass:"v-parallax__content"},this.$slots.default);return t("div",{staticClass:"v-parallax",style:{height:this.height+"px"},on:this.$listeners},[e,i])}}),v={},b=Object(d["a"])(v,o,c,!1,null,null,null),w=b.exports;h()(b,{VParallax:m});var x=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("v-parallax",{attrs:{dark:"",src:"https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg"}},[e("v-layout",{attrs:{"align-center":"",column:"","justify-center":""}},[e("h1",{staticClass:"display-2 font-weight-thin mb-3"},[t._v("Vuetify.js")]),e("h4",{staticClass:"subheading"},[t._v("Build your application today!")])])],1)},_=[],y=e("a722"),C={},j=Object(d["a"])(C,x,_,!1,null,null,null),E=j.exports;h()(j,{VLayout:y["a"],VParallax:m});var O=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("v-parallax",{attrs:{height:"300",src:"https://cdn.vuetifyjs.com/images/parallax/material2.jpg"}})},k=[],$={},H=Object(d["a"])($,O,k,!1,null,null,null),T=H.exports;h()(H,{VParallax:m});var B={components:{PageTitle:n["a"],"layout-wrapper":l["a"],"demo-card":r["a"],parallax1:w,parallax2:E,parallax3:T},data:function(){return{heading:"Parallax",subheading:"The v-parallax component creates a 3d effect that makes an image appear to scroll slower than the window.",icon:"pe-7s-plane icon-gradient bg-tempting-azure"}},methods:{}},S=B,D=Object(d["a"])(S,i,s,!1,null,null,null);a["default"]=D.exports},"8b1e":function(t,a,e){"use strict";var i=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div",{staticClass:"app-page-title"},[e("div",{staticClass:"page-title-wrapper"},[e("div",{staticClass:"page-title-heading"},[e("div",[t._v(" "+t._s(t.heading)+" "),e("div",{staticClass:"page-title-subheading"},[t._v(t._s(t.subheading))])])]),e("div",{staticClass:"page-title-actions"},[e("button",{staticClass:"btn-shadow d-inline-flex align-items-center btn btn-success",attrs:{type:"button"}},[e("font-awesome-icon",{staticClass:"mr-2",attrs:{icon:"plus"}}),t._v("Create New ")],1)])])])},s=[],n=e("ecee"),l=e("c074"),r=e("ad3d");n["c"].add(l["X"],l["R"]);var o={components:{"font-awesome-icon":r["a"]},props:{icon:String,heading:String,subheading:String}},c=o,d=e("2877"),u=Object(d["a"])(c,i,s,!1,null,null,null);a["a"]=u.exports},a722:function(t,a,e){"use strict";e("db6d");var i=e("e8f2");a["a"]=Object(i["a"])("layout")},ad6b:function(t,a,e){"use strict";var i=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div",{staticClass:"card main-card mb-3"},[e("div",{staticClass:"card-header p-3 h-auto d-block"},[e("div",{staticClass:"d-block"},[t._v(t._s(t.heading))]),e("div",{staticClass:"d-block font-weight-normal text-capitalize mt-1 grey--text"},[t._v(t._s(t.subheading))])]),e("div",{staticClass:"card-body"},[t._t("default")],2)])},s=[],n={components:{},props:["heading","subheading"]},l=n,r=e("2877"),o=Object(r["a"])(l,i,s,!1,null,null,null);a["a"]=o.exports},fd71:function(t,a,e){}}]);