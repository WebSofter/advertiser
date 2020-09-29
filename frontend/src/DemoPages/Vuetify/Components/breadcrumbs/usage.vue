<template>
  <div>
    <v-breadcrumbs :items="items" divider=">"></v-breadcrumbs>
  </div>
</template>

<script>
export default {
  data: () => ({
    items: [
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
  }),
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
};
</script>
