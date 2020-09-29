<template>
  <div>
    <v-breadcrumbs :items="items" divider=">"></v-breadcrumbs>
  </div>
</template>

<script>
export default {
  data: () => ({
    items: []
    /*
    [
      {
        text: "Dashboard",
        disabled: false,
        href: "breadcrumbs_dashboard"
      },
      {
        text: "Link 1",
        disabled: false,
        href: "breadcrumbs_link_1"
      },
      {
        text: "Link 2",
        disabled: true,
        href: "breadcrumbs_link_2"
      },
      {
        text: '4444',
        disabled: true,
        href: '#',
      },
    ]
    */
  }),
  /*
  watch : {
    '$route' () {
      console.log(this.$route)
    }
  },
  */
  created() {
      let pathArray = this.$route.path.split("/")
      pathArray.shift()
      pathArray.forEach((c, i, a)=>{
        if(c.match( /\d+/g )){
          a.splice(i, 1)
        }
      })
      
    this.items = pathArray.reduce((arr, path, index) => {
      this.$router.options.routes.forEach(route => {
        if(route.path.indexOf(path) > -1 && route.hasOwnProperty('meta')){
          //console.log(route.meta)
        }
      })
      
      //
      arr.push({
        text: path.charAt(0).toUpperCase() + path.slice(1),
        disabled: false,
        href: window.location.href.split(path)[0] + path, //path, //'https://crm.wsofter.ru:4545/dashboards/campaigns/86/tasks'
      })
      
      return arr
    }, [])
    /* 
      let breadcrumbs = pathArray.reduce((breadcrumbArray, path, idx) => {
        breadcrumbArray.push({
          path: path,
          to: breadcrumbArray[idx - 1]
            ? "/" + breadcrumbArray[idx - 1].path + "/" + path
            : "/" + path,
          text: this.$route.matched[idx].meta.breadCrumb || path,
        });
        return breadcrumbArray;
      }, [])
    */
    //console.log(breadcrumbs)
  },
  /*
  computed: {
    items: function() {
      let pathArray = this.$route.path.split("/")
      pathArray.shift()
      let breadcrumbs = pathArray.reduce((breadcrumbArray, path, idx) => {
        breadcrumbArray.push({
          path: path,
          to: breadcrumbArray[idx - 1]
            ? "/" + breadcrumbArray[idx - 1].path + "/" + path
            : "/" + path,
          text: this.$route.matched[idx].meta.breadCrumb || path,
        });
        return breadcrumbArray;
      }, [])
      return breadcrumbs;
    }
  }
  */
}
</script>
