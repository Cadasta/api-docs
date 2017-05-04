## Questionnaires

Each project in the Cadasta Platform requires a questionnaire in order to work. This questionnaire creates the essential framework for data collection, either online or in the field.

Using the API, you can get the structure of your questionnaire in JSON format, or you can replace the questionnaire being used for a project.

Note that you **cannot** replace a questionnaire in an active project once data is being collected about it.

_To learn more about how questionnaires work, <a href="https://docs.cadasta.org/en/08-XLSForms.html" target="_blank">see our documentation on Questionnaires & Custom Data Collection</a>._

The endpoint you'll use to work with questionnaires begins with:

```
/api/v1/organizations/{organization_slug}/projects/{project_slug}/questionnaire/
```

A questionnaire JSON object contains the following properties:

Property | Type | Description
---|---|:---:|---
`id` | `String` | The questionnaire ID.
`filename` | `String` | The file name of the questionnaire.
`title` | `String` | The questionnaire title.
`id_string` | `String` | The unique ID for the spreadsheet, as defined in the spreadsheet itself in the Settings tab.
`xls_form` | `String` | Link to an Excel spreadsheet version of the form hosted on Amazon AWS.
`version` | `String` | Time stamp when the questionnaire was last updated
`questions` | `Array` | List of questions, charted in the **Questions** section below.
`question_groups` | `Array` | List of question groups, charted in the **Question Groups** section below.

**Question Groups**

Property | Type | Description
---|---|---
`id` | `String` | The ID of the question group.
`name` | `String` | Question group name, usually used to identify the group in the form.
`label` | `String` | Question group label, usually displayed to the user.
`questions` | `Array` | List of questions in the group. See the Questions table below.
`relevant` | `String` | A reference to another field and corresponding value indicating when the field is displayed.

**Questions**

Property | Type | Description
---|---|---
`id` | `String` | The ID of the question.
`name` | `String` | Question name, usually used to identify fields in the form.
`label` | `String` | Question label, usually displayed to the user.
`type` | `String` | The field type, based on the question types available through <a href="http://xlsform.org/#question-types" target="_blank">XLSforms]</a>. See the table below to see how they translate.
`required` | `Boolean` | Indicates whether the field is required.
`constraint` | `String` | The range of accepted values for the field. <a href="http://xlsform.org/#constraints" target="_blank">See XLSForms documentation</a> for more information.
`default` | `String`  | The default value of the field.
`hint`| `String` | An additional help text describing details of the field, usually displayed next to the field label.
`relevant` | `String` | A reference to another field and corresponding value indicating when the field is displayed.
`options` | `Array` | A list of choices, only relevant if `type` is `select_one` or `select_multiple`. See **Options** table below for more information.


**Options**

Property | Type | Required? | Description
---|---|:---:|---
`id` | `String` | x | The ID of the choice option.
`name` | `String`  | x | Choice name, usually as value for the form field.
`label` | `String`  | x | Choice label, usually displayed to the user.

**`type` Options**

Use this chart to figure out what type of question you're using in your form.

`type` | XLSform | Answer Input
---|---|---
`IN` | `integer` |	Integer (i.e., whole number) input.
`DE` | `decimal` |	Decimal input.
`TX` | `text` |	Free text response.
`S1` | `select_one` | Multiple choice question; only one answer can be selected.
`SM` | `select_multiple` | Multiple choice question; multiple answers can be selected.
`NO` | `note` |	Display a note on the screen, takes no input.
`GP` | `geopoint` |	Collect a single GPS coordinates.
`GT` | `geotrace` |	Record a line of two or more GPS coordinates.
`GS` | `geoshape` |	Record a polygon of multiple GPS coordinates; the last point is the same as the first point.
`DA` | `date` |	Date input.
`TI` | `time` |	Time input.
`DT` | `dateTime` |	Accepts a date and a time input.
`PH` | `image` / `photo`| Take a picture.
`AU` | `audio` | Take an audio recording.
`VI` | `video` | Take a video recording.
`BC` | `barcode` | Scan a barcode, requires the barcode scanner app to be installed.
`CA` | `calculate` | Perform a calculation; see the Calculation section below.
`AC` | `acknowledge` | Acknowledge prompt that sets value to “OK” if selected.

The following values are for metadata that your questionnaire may be collecting:

`type` | XLSform | Answer Input
---|---|---
`ST` | `start` | Indicates the start of the survey.
`EN` | `end` | Indicates the end of the survey.
`TD` | `today` | Day of the survey.
`DI` | `deviceid` | IMEI (International Mobile Equipment Identity)
`SI` | `subscriberid` | IMSI (International Mobile Subscriber Identity)
`SS` | `simserial` | SIM serial number.
`PN` | `phonenumber` | Phone number of the device (if available)


##### Example Questionnaire JSON Object

```json
{
  "filename": "wa6hrqr4e4vcf49q6kxjc443",
  "id": "pignmhca2xgtpprcuw79fawb",
  "id_string": "wa6hrqr4e4vcf49q6kxjc443",
  "md5_hash": "0c359dabdbe5006c68c44438ccd86c1f",
  "question_groups": [
    {
      "id": "4x5nwwvs523cta83umn6ucc9",
      "index": 0,
      "label": "Tenure relationship attributes",
      "label_xlat": "Tenure relationship attributes",
      "name": "tenure_relationship_attributes",
      "question_groups": [],
      "questions": [
        {
          "constraint": null,
          "default": null,
          "hint": null,
          "id": "2tecu2qsjyihkk7acqwnpdhp",
          "index": 0,
          "label": "Notes",
          "label_xlat": "Notes",
          "name": "notes",
          "relevant": null,
          "required": false,
          "type": "TX"
        }
      ],
      "relevant": null,
      "type": "group"
    },
    {
      "id": "8y8hv2vmp25crcytqf4gcsk3",
      "index": 1,
      "label": "Default Party Attributes",
      "label_xlat": "Default Party Attributes",
      "name": "party_attributes_default",
      "question_groups": [],
      "questions": [
        {
          "constraint": null,
          "default": null,
          "hint": null,
          "id": "dsqj28xdx4m8wu3e8kstnwx7",
          "index": 0,
          "label": "Notes",
          "label_xlat": "Notes",
          "name": "notes",
          "relevant": null,
          "required": false,
          "type": "TX"
        }
      ],
      "relevant": null,
      "type": "group"
    },
    {
      "id": "zu7wigmdketa7xnherh6295f",
      "index": 2,
      "label": "Location Attributes",
      "label_xlat": "Location Attributes",
      "name": "location_attributes",
      "question_groups": [],
      "questions": [
        {
          "constraint": null,
          "default": null,
          "hint": null,
          "id": "wy32hht8ckfrbh4btnk6tg55",
          "index": 0,
          "label": "Name of Location",
          "label_xlat": "Name of Location",
          "name": "name",
          "relevant": null,
          "required": false,
          "type": "TX"
        },
        {
          "constraint": null,
          "default": "null",
          "hint": "Quality of parcel geometry",
          "id": "bcivhzvawbznknrgz99mh55s",
          "index": 1,
          "label": "Spatial Unit Quality",
          "label_xlat": "Spatial Unit Quality",
          "name": "quality",
          "options": [
            {
              "id": "gfpftuhcz73wmifur248bh2u",
              "index": 1,
              "label": "No data",
              "label_xlat": "No data",
              "name": "null"
            },
            {
              "id": "hid7jsnun2twnnfscvkyx25w",
              "index": 2,
              "label": "Textual",
              "label_xlat": "Textual",
              "name": "text"
            },
            {
              "id": "5qssuz7ig5wzymb33d2rat2p",
              "index": 3,
              "label": "Point data",
              "label_xlat": "Point data",
              "name": "point"
            },
            {
              "id": "pb8rsyum45hrvwasebmzernb",
              "index": 4,
              "label": "Low quality polygon",
              "label_xlat": "Low quality polygon",
              "name": "polygon_low"
            },
            {
              "id": "9pb2uthpy7w44f9yq4vrmgcm",
              "index": 5,
              "label": "High quality polygon",
              "label_xlat": "High quality polygon",
              "name": "polygon_high"
            }
          ],
          "relevant": null,
          "required": false,
          "type": "S1"
        },
        {
          "constraint": null,
          "default": "OT",
          "hint": null,
          "id": "easzuvr9vyqspai2jg9hcusa",
          "index": 2,
          "label": "How was this location acquired?",
          "label_xlat": "How was this location acquired?",
          "name": "acquired_how",
          "options": [
            {
              "id": "3y4j9d35pcy7dnkpmzspd4hz",
              "index": 1,
              "label": "Contractual Share Crop",
              "label_xlat": "Contractual Share Crop",
              "name": "CS"
            },
            {
              "id": "hy95hvwvgidx8av7tv5e2va2",
              "index": 2,
              "label": "Customary Arrangement",
              "label_xlat": "Customary Arrangement",
              "name": "CA"
            },
            {
              "id": "88i4xdyg9qufm89biarqhcf3",
              "index": 3,
              "label": "Gift",
              "label_xlat": "Gift",
              "name": "GF"
            }
          ],
          "relevant": null,
          "required": false,
          "type": "S1"
        },
        {
          "constraint": null,
          "default": "null",
          "hint": null,
          "id": "ckargaqthq4gby7f3u5ywd2f",
          "index": 3,
          "label": "When was this location acquired?",
          "label_xlat": "When was this location acquired?",
          "name": "acquired_when",
          "relevant": null,
          "required": false,
          "type": "DA"
        },
        {
          "constraint": null,
          "default": null,
          "hint": "Additional Notes",
          "id": "557mb6s7sv5k8dhcvcqsugc7",
          "index": 4,
          "label": "Notes",
          "label_xlat": "Notes",
          "name": "notes",
          "relevant": null,
          "required": false,
          "type": "TX"
        }
      ],
      "relevant": null,
      "type": "group"
    }
  ],
  "questions": [
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "ybqnrd3qbg2a3if75p4ybcda",
      "index": 3,
      "label": "Start",
      "label_xlat": "Start",
      "name": "start",
      "relevant": null,
      "required": false,
      "type": "ST"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "d28dw58n6n6ptigkyjcqzqfm",
      "index": 4,
      "label": "End",
      "label_xlat": "End",
      "name": "end",
      "relevant": null,
      "required": false,
      "type": "EN"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "vmgdx4mtsuy2tssvc923naat",
      "index": 5,
      "label": "Today",
      "label_xlat": "Today",
      "name": "today",
      "relevant": null,
      "required": false,
      "type": "TD"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "ygzf4z769ry28dpfmvnttacm",
      "index": 6,
      "label": "DeviceId",
      "label_xlat": "DeviceId",
      "name": "deviceid",
      "relevant": null,
      "required": false,
      "type": "DI"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "w3ihrqpq9pv4g754p68nd4y3",
      "index": 7,
      "label": "Cadasta Platform - UAT Survey",
      "label_xlat": "Cadasta Platform - UAT Survey",
      "name": "title",
      "relevant": null,
      "required": false,
      "type": "NO"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "njksjf6sy8imsqhsu5twbdt6",
      "index": 8,
      "label": "Party Classification",
      "label_xlat": "Party Classification",
      "name": "party_type",
      "options": [
        {
          "id": "qzaxe9jx5sym69vqxxj2z6s8",
          "index": 1,
          "label": "Group",
          "label_xlat": "Group",
          "name": "GR"
        },
        {
          "id": "4afq8wfhv93czkveb43chqpq",
          "index": 2,
          "label": "Individual",
          "label_xlat": "Individual",
          "name": "IN"
        },
        {
          "id": "9ew3kquph5nw4v4xaccyx7xq",
          "index": 3,
          "label": "Corporation",
          "label_xlat": "Corporation",
          "name": "CO"
        }
      ],
      "relevant": null,
      "required": true,
      "type": "S1"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "szdxshbt6hq9f2qpyff4aq6s",
      "index": 9,
      "label": "Party Name",
      "label_xlat": "Party Name",
      "name": "party_name",
      "relevant": null,
      "required": true,
      "type": "TX"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "tr42se28bs44m92uc6xtpb9q",
      "index": 10,
      "label": "Location of Parcel",
      "label_xlat": "Location of Parcel",
      "name": "location_geometry",
      "relevant": null,
      "required": false,
      "type": "GT"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "sg8x3ggnuwn8ci6frgc9jmw4",
      "index": 11,
      "label": "What is the land feature?",
      "label_xlat": "What is the land feature?",
      "name": "location_type",
      "options": [
        {
          "id": "32ks5s69uj7t84ydcniyg5wd",
          "index": 1,
          "label": "Parcel",
          "label_xlat": "Parcel",
          "name": "PA"
        },
        {
          "id": "8z5qq8dtsjtvxgd445ei4rc7",
          "index": 2,
          "label": "Community Boundary",
          "label_xlat": "Community Boundary",
          "name": "CB"
        },
        {
          "id": "ksj3qsxmud8xe67b78pnyri7",
          "index": 3,
          "label": "Building",
          "label_xlat": "Building",
          "name": "BU"
        }
      ],
      "relevant": null,
      "required": true,
      "type": "S1"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "umxciy3sz28j379qkxmngjyv",
      "index": 12,
      "label": "Photo of Parcel?",
      "label_xlat": "Photo of Parcel?",
      "name": "location_photo",
      "relevant": null,
      "required": false,
      "type": "PH"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "as4tw2yf8bpm7grfxjyxwhf6",
      "index": 13,
      "label": "Photo of Party?",
      "label_xlat": "Photo of Party?",
      "name": "party_photo",
      "relevant": null,
      "required": false,
      "type": "PH"
    },
    {
      "constraint": null,
      "default": null,
      "hint": null,
      "id": "qwythvtbuech8fgirt3fqapa",
      "index": 14,
      "label": "What is the social tenure type?",
      "label_xlat": "What is the social tenure type?",
      "name": "tenure_type",
      "options": [
        {
          "id": "7jxjinrf56vudyfnyuwdytg2",
          "index": 1,
          "label": "All Types",
          "label_xlat": "All Types",
          "name": "AL"
        },
        {
          "id": "7yjd2yqnmdku52em9sst3sck",
          "index": 2,
          "label": "Carbon Rights",
          "label_xlat": "Carbon Rights",
          "name": "CR"
        },
        {
          "id": "37ewegjhj4duvrgqw5erzrnz",
          "index": 3,
          "label": "Concessionary Rights",
          "label_xlat": "Concessionary Rights",
          "name": "CO"
        }
      ],
      "relevant": null,
      "required": true,
      "type": "S1"
    }
  ],
  "title": "wa6hrqr4e4vcf49q6kxjc443",
  "version": 2017011815055872,
  "xls_form": ""
}

```










### Get the Project's Current Questionnaire

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/{project_slug}/questionnaire/
```

Returns the projects current questionnaire structure.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).


**Response**

The response body contains a full [questionnaire JSON object](#example-questionnaire-json-object), including questions and question groups.















### Replace the Project's Current Questionnaire

```endpoint
PUT /api/v1/organizations/{organization_slug}/projects/{project_slug}/questionnaire/
```

This method creates a new questionnaire for the project. Questionnaires are either created by providing a link to a XLSForm or by providing a valid Questionnaire JSON object.

**Note:** At the moment, updating the questionnaire is only possible as long as no data has been contributed to the project. If you need to change your questionnaire, you need to [create a new project](#create-a-new-project).


**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).


**Request Payload: XLS Form Replacement**

The request payload is a JSON object containing the following properties.

Property | Description
---|---
`xls_form` | A link to a XLSForm stored on an accessible server.


**Request Payload: Replacement by JSON Object**

> This feature is still being developed. Documentation to be completed when it's done.

Creating a questionnaire from a JSON object requires a full [questionnaire JSON object](#example-questionnaire-json-object) provided with the request payload.

**Response**

The response body contains a full [questionnaire JSON object](#example-questionnaire-json-object), including questions and question groups.
