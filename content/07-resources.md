## Project Resources

For any given project, there are lots of resources that may be collected: letters, deeds, photographs, audio recordings, etc. Using the Cadasta API, you can list all the resources connected to a specific project, as well as create, view, and update individual ones.

_<a href="https://docs.cadasta.org/en/04-records.html#project-resources" target="_blank">Read more about Project Resources in our Platform Documentation</a>_

To access project resources using the API, use the following endpoint:

```
/api/v1/organizations/{organization_slug}/projects/{project_slug}/resources/
```

### Project Resource Object

Each project resource appears as a JSON object with the following properties:

Property | Type | Description
--- | --- | ---
`id` | `String` | A unique ID automatically generated for the file.
`name` | `String` | The name of the file (e.g. Deed of Trust)
`description` | `String` | A description of the file (e.g. The only deed we can find that has information relevant to the site.)
`file` | `String` | URL to a hosted version of the file, likely on an Amazon server or something similar.
`original_file` | `String` | Original file name (e.g. deed-of-trust.pdf).
`archived` | `Boolean` | Indicates whether the file has been archived or not.


#### Example Project Resource JSON Object

```json
{
  "id": "8u5dgnvgzix6kmg9hvbfdy3c",
  "name": "Deed",
  "description": "",
  "file": "https://example.com/resources/wcajeysz7ngrae3bd84af99q.pdf",
  "original_file": "Deed-of-Trust-1912.pdf",
  "archived": false
}
```















### List Project Resources

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/{project_slug}/resources/
```

Use this method and endpoint to list out all the resources associated with any given project.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations)
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).


**Response**

The response body is an array containing a series of [project resource JSON objects](#project-resource-object).

#### Example Response

```json
{
  "count": 3,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": "8u5dgnvgzix6kmg9hvbfdy3c",
      "name": "Deed",
      "description": "",
      "file": "https://example.com/resources/wcajeysz7ngrae3bd84af99q.pdf",
      "original_file": "Deed-of-Trust-1912.pdf",
      "archived": false
    },
    {
      "id": "xnbqgubg99x6w54q363tjx5d",
      "name": "Ross Island - 1963",
      "description": "",
      "file": "https://example.com/resources/tab6kkdfx9c5pifzsmmh4iep.jpg",
      "original_file": "a2004-001-1012-marquam-bridge-under-construction-1963.jpg",
      "archived": false
    },
    {
      "id": "p5d2wb5xnj4bn93vve8ntzwc",
      "name": "Ross Island Aerial - 1945",
      "description": "",
      "file": "https://example.com/resources/acguba29wstyexf8uhxkvezn.jpg",
      "original_file": "a2005-001-815-ross-island-bridge-west-approach-north-at-sw-kelly-1945.jpg",
      "archived": false
    }
  ]
}
```











### Create a New Project Resource

```endpoint
POST /api/v1/organizations/{organization_slug}/projects/{project_slug}/resources/
```

Use this endpoint and method to create a new project resource.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations)
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).

**Request Payload**

To create a new resource, you'll need to provide the following properties:

Property | Type | Required? | Description
--- | --- | :---: | ---
`name` | `String` | x | The name of the file (e.g. Deed of Trust)
`description` | `String` |  | A description of the file (e.g. The only deed we can find that has information relevant to the site.)
`file` | `String` | x | URL to a hosted version of the file, likely on an Amazon server or something similar.
`original_file` | `String` | x | Original file name (e.g. deed-of-trust.pdf).
`archived` | `Boolean` | x | Indicates whether the file has been archived or not.


**Response**

The response body contains a [project resource JSON object](#project-resource-object).

#### Example Response

```json
{
  "id": "rtxixdb2a5weefmzmg7kzvgr",
  "name": "Original Questionnaire",
  "description": "This is the original questionnaire we were using; we updated it on 10.31.2016.",
  "file": "https://example.com/minimum_cadasta_questionnaire.xlsx",
  "original_file": "mimimum_cadasta_questionnaire.xlsx",
  "archived": false
}

```














### Get a Project Resource

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/{project_slug}/resources/{resource_id}/
```

Use this method and endpoint to get a specific project resource.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations)
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).
`resource_id` | The unique ID for the project resource. You can find this resource by [listing all of the resources for the project](#list-project-resources), finding the project you're looking for, and then copying the ID.


**Response**

The response body contains a [project resource JSON object](#project-resource-object).

#### Example Response

```json
{
  "id": "rtxixdb2a5weefmzmg7kzvgr",
  "name": "Original Questionnaire",
  "description": "This is the original questionnaire we were using; we updated it on 10.31.2016.",
  "file": "https://example.com/minimum_cadasta_questionnaire.xlsx",
  "original_file": "mimimum_cadasta_questionnaire.xlsx",
  "archived": false
}

```













### Update a Project Resource

```endpoint
PATCH /api/v1/organizations/{organization_slug}/projects/{project_slug}/resources/{resource_id}/
```

Use this method and endpoint to update the name, description, file, original file name, and archive status of any resource.

**URL Parameter**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations)
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).
`resource_id` | The unique ID for the project resource. You can find this resource by [listing all of the resources for the project](#list-project-resources), finding the project you're looking for, and then copying the ID.

**Request Payload**

Modify any value of the following fields of the project resource JSON object:

Property | Type | Description
--- | --- | ---
`name` | `String` | The name of the file (e.g. Deed of Trust)
`description` | `String` | A description of the file (e.g. The only deed we can find that has information relevant to the site.)
`file` | `String` | URL to a hosted version of the file, likely on an Amazon server or something similar.
`original_file` |`String` | Original file name (e.g. deed-of-trust.pdf).
`archived` | `Boolean` | Indicates whether the file has been archived or not.


**Response**

The response body contains a [project resource JSON object](#project-resource-object).

#### Example Response

```json
{
  "id": "rtxixdb2a5weefmzmg7kzvgr",
  "name": "Original Questionnaire",
  "description": "This is the original questionnaire we were using; we updated it on 10.31.2016.",
  "file": "https://example.com/minimum_cadasta_questionnaire.xlsx",
  "original_file": "mimimum_cadasta_questionnaire.xlsx",
  "archived": false
}

```













## Spatial Resources

Sometimes your resources may be in the form of an XML file (usually converted from a GPS Exchange Format, or .gpx). You can use this API to return all of the GPS coordinates logged in the file.

Spatial resources can be accessed using endpoints that start like this:

```
/api/v1/organizations/{organization_slug}/projects/{project_slug}/spatialresources/
```

### List All Spatial Resources

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/{project_slug}/spatialresources/
```

Use this endpoint to return all of the spatial resources in a given project, along with the GPS coordinates in each resource.

**Response**

The response is an array of [project resource JSON objects](#project-resource-object), each with an additional `spatial_resources` object field.

The `spatial_resources` object has the following properties:

Property | Type | Description
--- | --- | ---
`id` | `String` | A unique ID automatically generated for the file.
`name` | `String` | The name of the file (e.g. Waypoints)
`time` | `String` | The date and time that the file was uploaded.
`geom` | `Array` | The object containing all of the geometric information in the spatial resource. (See the `geom` table below.)

The `geom` object has the following properties:

Property | Type | Description
--- | --- | ---
`geometries` | `Array` | Contains an array of all the coordinates and type of coordinates for a particular spatial resource.
`type` | `String` | The type of coordinate collection (usually listed as `GeometryCollection`). (See the `geometries` table below.)

The objects in `geometries` each have the following properties:

Property | Type | Description
--- | --- | ---
`coordinates` | `Array` | Contains the latitude and longitude coordinates for each point.
`type` | `String` | The type of coordinate (usually set to `Point`).


#### Example Response

```json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": "casjsraq9hmqaxkuh6scmue2",
      "name": "Waypoints",
      "description": "",
      "original_file": "Example (Waypoints_26-NOV-15).xml",
      "archived": false,
      "spatial_resources": [
        {
          "id": "ancghgmzbk8wi92fgt9yszdt",
          "name": "waypoints",
          "time": "2016-11-08T17:54:43.903091Z",
          "geom": {
            "geometries": [
              {
                "coordinates": [
                  3.35652,
                  6.464177
                ],
                "type": "Point"
              },
              {
                "coordinates": [
                  3.356425,
                  6.462206
                ],
                "type": "Point"
              },
              {
                "coordinates": [
                  3.35627,
                  6.46216
                ],
                "type": "Point"
              },
              {
                "coordinates": [
                  3.356593,
                  6.462282
                ],
                "type": "Point"
              }
            ],
            "type": "GeometryCollection"
          }
        }
      ]
    },
    {
      "id": "uqzbwpbeiyejfafx8t7nadcr",
      "name": "Waypoints 2",
      "description": "",
      "original_file": "Example 2 (Waypoints_26-NOV-15).xml",
      "archived": false,
      "spatial_resources": [
        {
          "id": "ryqfpbk6jmmrjshq7t7yguij",
          "name": "waypoints",
          "time": "2016-11-08T18:09:39.076667Z",
          "geom": {
            "geometries": [
              {
                "coordinates": [
                  4.35652,
                  7.464177
                ],
                "type": "Point"
              },
              {
                "coordinates": [
                  3.356389,
                  6.462436
                ],
                "type": "Point"
              },
              {
                "coordinates": [
                  4.356569,
                  7.462434
                ],
                "type": "Point"
              },
              {
                "coordinates": [
                  4.356593,
                  7.462282
                ],
                "type": "Point"
              }
            ],
            "type": "GeometryCollection"
          }
        }
      ]
    }
  ]
}
```
