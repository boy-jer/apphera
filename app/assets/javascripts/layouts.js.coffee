$ ->
  $("#location_selector").kendoDropDownList
    dataTextField: "name"
    dataValueField: "id"
    dataSource:
      type: "json"
      serverFiltering: false
      # filter: [
      #        field: "Name"
      #        operator: "contains"
      #        value: "Star Wars"
      #      ,
      #        field: "BoxArt.SmallUrl"
      #        operator: "neq"
      #        value: null
      #       ]
      transport:
        read: "/organizations/myorgs.json"