<template>
  <div>
    <div>
        <Breadcrumbs/>
    </div>
    <b-card title="Basic" class="main-card mb-4">
      <b-row>
          <b-col lg="6" class="my-1">
              <b-form-group horizontal label="" class="mb-0">
                  <b-input-group class="dynamic-tables__select">
                      <span class="dynamic-tables__select-span">Show</span>
                      <b-form-select :options="pageOptions" v-model="perPage" />
                      <span class="dynamic-tables__select-span">entries</span>
                  </b-input-group>
              </b-form-group>
          </b-col>
          <b-col lg="6" class="my-1 dynamic-tables__search">
          <b-form-group horizontal class="mb-0">
                <b-input-group>
                  <b-form-input v-model="filter" placeholder="Search" />
                  <b-input-group-append>
                    <b-btn :disabled="!filter" @click="filter = ''">Clear</b-btn>
                  </b-input-group-append>
                </b-input-group>
              </b-form-group>
          </b-col>
      </b-row>

      <!-- Main table element -->
      <b-table show-empty stacked="md" :items="items" :fields="fields" :current-page="currentPage"
                 :per-page="perPage" :filter="filter" :sort-by.sync="sortBy" :sort-desc.sync="sortDesc"
                 :sort-direction="sortDirection"  @filtered="onFiltered" >
                <template #cell(showDetails)="row">
                    <b-button size="sm"  @click.stop="row.toggleDetails">{{ row.detailsShowing ? 'Hide' : 'Show' }} Details</b-button>
                </template>
                <template #cell(edit)="row">
                    <b-button size="sm">Edit</b-button>
                </template>
                <template #cell(delete)="row">
                    <b-button size="sm">Delete</b-button>
                </template>
                <template slot="row-details" slot-scope="row">
                    <b-card class="no-shadow">
                        <ul class="list-group">
                            <li class="list-group-item" v-for="(value, key) in row.item" :key="key">{{ key }}: {{ value}}</li>
                        </ul>
                    </b-card>
                </template>
        </b-table>
      <b-row>
        <b-col lg="12" md="6" class="my-1 space-between">
          <p>Showing 1 to {{perPage}} of {{totalRows}} entries</p>
          <b-pagination :total-rows="totalRows" :per-page="perPage" v-model="currentPage" class="my-0" />
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
import Breadcrumbs from "../Vuetify/Components/breadcrumbs/usage";
const items = [
  {
      id: 1,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 4,
  },
  {
      id: 2,
      name: 'Geneva Wilson',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 24,
  },
  {
      id: 3,
      name: 'Larsen Shaw',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 44,
  },
  {
      id: 4,
      name: 'Dick Dunlap',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 564,
  },
  {
      id: 5,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 4,
  },
  {
      id: 6,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 4,
  },
  {
      id: 7,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 4,
  },
  {
      id: 8,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 4,
  },
  {
      id: 9,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 4,
  },
  {
      id: 10,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 11,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 12,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 13,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 14,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 15,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 16,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 17,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 18,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 19,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
  {
      id: 20,
      name: 'Dickerson Macdonald',
      value1: 'Lorem ipsum id',
      icon1: 'lorem',
      manager: 'Lorem sed',
      icon2: 'lorem',
      value2: 'Lorem ipsum id',
      date1: '04.02.2020',
      date2: '10.11.1897',
      status1: 'Lorem non',
      status2: 'lorem',
      value3: 456,
  },
];

export default {
  components: {
      Breadcrumbs
  },
  data: () => ({
    items: items,
    fields: [
      {
        key: 'id',
        label: 'ID',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'name',
        label: 'Name',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'value1',
        label: 'Value1',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'icon1',
        label: 'Icon 1',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'manager',
        label: 'Manager',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'icon2',
        label: 'Icon2',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'value2',
        label: 'Value2',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'date1',
        label: 'Date1',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'date2',
        label: 'Date2',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'status1',
        label: 'Status1',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'status2',
        label: 'Status2',
        sortable: true,
        sortDirection: 'desc'
      },
      {
        key: 'value3',
        label: 'Value3',
        sortable: true,
        sortDirection: 'desc'
      },
      { key: "showDetails", label: 'Show Details' },
      { key: "edit", label: 'Edit' },
      { key: "delete", label: 'Delete' },
    ],
    currentPage: 1,
    perPage: 5,
    totalRows: items.length,
    pageOptions: [5, 10, 15],
    sortBy: null,
    sortDesc: false,
    sortDirection: "asc",
    filter: null,
    modalInfo: { title: "", content: "" },
  }),

  computed: {

  },
  methods: {
    info(item, index, button) {
      this.modalInfo.title = `Row index: ${index}`;
      this.modalInfo.content = JSON.stringify(item, null, 2);
      this.$root.$emit("bv::show::modal", "modalInfo", button);
    },
    resetModal() {
      this.modalInfo.title = "";
      this.modalInfo.content = "";
    },
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    }
  }
};
</script>

<style lang="scss" scoped>
 .dynamic-tables {
     &__search {

     }
     &__select {
         display: flex;
         align-items: center;
         .custom-select {
             margin-left: .5rem;
             margin-right: .5rem;
             max-width: 4.25rem;
         }
         &-span {
             line-height: 2.25rem;
         }
     }
 }
 .space-between {
     display: flex;
     justify-content: space-between;
 }
</style>