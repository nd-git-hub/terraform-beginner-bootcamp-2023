7  cd terraform-provider-terratowns/

## go.mod just need below code, it will add remaining repository during go get as below
### go.sum will be created automatically after go get 
module github.com/ExamProCo/terraform-provider-terratowns

go 1.20

replace github.com/ExamProCo/terraform-provider-terratowns => /workspace/terraform-beginner-bootcamp-2023/terraform-provider-terratowns

---------------------

  touch go.mod
   10  touch go.sum
   11  touch main.go
   12  echo $PROJECT_ROOT 
   13  export PLUGIN_NAME="terraform-provider-terratowns_v1.0.0"
   14  go build -o $PLUGIN_NAME
   gitpod /workspace/terraform-beginner-bootcamp-2023/terraform-provider-terratowns (44-terratowns-providers) $ go build -o $PLUGIN_NAME
main.go:9:2: no required module provides package github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema; to add it:
        go get github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema
main.go:10:2: no required module provides package github.com/hashicorp/terraform-plugin-sdk/v2/plugin; to add it:
        go get github.com/hashicorp/terraform-plugin-sdk/v2/plugin
gitpod /workspace/terraform-beginner-bootcamp-2023/terraform-provider-terratowns (44-terratowns-providers) $ go get github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema
go: downloading github.com/hashicorp/terraform-plugin-sdk v1.17.2
go: downloading github.com/hashicorp/terraform-plugin-sdk/v2 v2.29.0
go: downloading github.com/hashicorp/go-cty v1.4.1-0.20200414143053-d3edf31b6320
go: downloading github.com/hashicorp/go-multierror v1.1.1
go: downloading github.com/google/go-cmp v0.5.9
go: downloading github.com/mitchellh/copystructure v1.2.0
go: downloading github.com/hashicorp/terraform-plugin-go v0.19.0
go: downloading github.com/hashicorp/terraform-plugin-log v0.9.0
go: downloading github.com/mitchellh/go-testing-interface v1.14.1
go: downloading github.com/mitchellh/mapstructure v1.5.0
go: downloading github.com/hashicorp/go-version v1.6.0
go: downloading github.com/hashicorp/go-uuid v1.0.3
go: downloading github.com/mitchellh/reflectwalk v1.0.2
go: downloading github.com/hashicorp/logutils v1.0.0
go: downloading github.com/hashicorp/hcl/v2 v2.18.0
go: downloading github.com/zclconf/go-cty v1.14.0
go: downloading github.com/hashicorp/errwrap v1.0.0
go: downloading github.com/hashicorp/go-hclog v1.5.0
go: downloading github.com/vmihailenco/msgpack v4.0.4+incompatible
go: downloading golang.org/x/text v0.13.0
go: downloading github.com/vmihailenco/msgpack/v5 v5.3.5
go: downloading github.com/fatih/color v1.13.0
go: downloading github.com/mattn/go-colorable v0.1.12
go: downloading github.com/mattn/go-isatty v0.0.14
go: downloading google.golang.org/appengine v1.6.7
go: downloading github.com/apparentlymart/go-textseg/v15 v15.0.0
go: downloading github.com/vmihailenco/tagparser/v2 v2.0.0
go: downloading golang.org/x/sys v0.12.0
go: downloading github.com/agext/levenshtein v1.2.2
go: downloading github.com/mitchellh/go-wordwrap v1.0.0
go: downloading github.com/golang/protobuf v1.5.3
go: downloading golang.org/x/net v0.13.0
go: downloading google.golang.org/protobuf v1.31.0
go: added github.com/agext/levenshtein v1.2.2
go: added github.com/apparentlymart/go-textseg/v15 v15.0.0
go: added github.com/fatih/color v1.13.0
go: added github.com/golang/protobuf v1.5.3
go: added github.com/google/go-cmp v0.5.9
go: added github.com/hashicorp/errwrap v1.0.0
go: added github.com/hashicorp/go-cty v1.4.1-0.20200414143053-d3edf31b6320
go: added github.com/hashicorp/go-hclog v1.5.0
go: added github.com/hashicorp/go-multierror v1.1.1
go: added github.com/hashicorp/go-uuid v1.0.3
go: added github.com/hashicorp/go-version v1.6.0
go: added github.com/hashicorp/hcl/v2 v2.18.0
go: added github.com/hashicorp/logutils v1.0.0
go: added github.com/hashicorp/terraform-plugin-go v0.19.0
go: added github.com/hashicorp/terraform-plugin-log v0.9.0
go: added github.com/hashicorp/terraform-plugin-sdk/v2 v2.29.0
go: added github.com/mattn/go-colorable v0.1.12
go: added github.com/mattn/go-isatty v0.0.14
go: added github.com/mitchellh/copystructure v1.2.0
go: added github.com/mitchellh/go-testing-interface v1.14.1
go: added github.com/mitchellh/go-wordwrap v1.0.0
go: added github.com/mitchellh/mapstructure v1.5.0
go: added github.com/mitchellh/reflectwalk v1.0.2
go: added github.com/vmihailenco/msgpack v4.0.4+incompatible
go: added github.com/vmihailenco/msgpack/v5 v5.3.5
go: added github.com/vmihailenco/tagparser/v2 v2.0.0
go: added github.com/zclconf/go-cty v1.14.0
go: added golang.org/x/net v0.13.0
go: added golang.org/x/sys v0.12.0
go: added golang.org/x/text v0.13.0
go: added google.golang.org/appengine v1.6.7
go: added google.golang.org/protobuf v1.31.0
gitpod /workspace/terraform-beginner-bootcamp-2023/terraform-provider-terratowns (44-terratowns-providers) $ ^C
gitpod /workspace/terraform-beginner-bootcamp-2023/terraform-provider-terratowns (44-terratowns-providers) $ go get github.com/hashicorp/terraform-plugin-sdk/v2/plugin
go: downloading github.com/hashicorp/go-plugin v1.5.1
go: downloading google.golang.org/grpc v1.57.0
go: downloading github.com/hashicorp/terraform-registry-address v0.2.2
go: downloading github.com/hashicorp/terraform-svchost v0.1.1
go: downloading github.com/hashicorp/yamux v0.0.0-20181012175058-2f1d1f20f75d
go: downloading github.com/oklog/run v1.0.0
go: downloading google.golang.org/genproto/googleapis/rpc v0.0.0-20230525234030-28d5490b6b19
gitpod /workspace/terraform-beginner-bootcamp-2023/terraform-provider-terratowns 