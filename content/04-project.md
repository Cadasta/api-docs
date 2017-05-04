## Projects

The Cadasta API allows you work with data for <a href="https://docs.cadasta.org/en/03-projects.html" target="_blank">projects</a> that have been added to the platform.

### Project JSON Object

A project JSON object contains the following properties.


Property | Type | Description
---|---|---
`id` | `String` | The ID of the project
`organization` | `Object` | [JSON object of the project's organization](#example-organization-json-object).
`country` | `String` |The country where the project is located; represented as a two-letter <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2" target="_blank">ISO 3166-1 alpha-2</a> code.
`name` | `String` |The name of the project.
`description`| `String` | A long-form description of the project.
`archived` | `Boolean` | Indicates whether the project has be archived.
`urls` | `Array` |A list of URLs to websites of this project.
`contacts` | `Array` |A list of contacts for this project. A contact is a JSON object containing `name`, `email` (optional) and `tel` (optional).
`users` | `Array` | JSON Object of all the project's members // ADD LINK
`access` | `String` | Indicates whether access to the project is restricted; is either `"public"` or `"private"`.
`slug` | `String` | The short label of the project; usually used in URLs.
`extent` | `Object` | A <a href="https://en.wikipedia.org/wiki/GeoJSON#Geometries" target="_blank"> GeoJSON geometry</a> of the project's geographic area.


##### Example Project JSON Object

```json
{
  "id": "z82wdtrf8m9sh56bdph6qeig",
  "organization": {
    "id": "3r48bi5xy8xzfu5d94smpb7a",
    "slug": "example-organization",
    "name": "Example Organization",
    "description": "Example Organization is a non-profit, non-governmental organization working to empower poor and marginalized individuals and communities.",
    "archived": false,
    "extent": {
      "type": "Polygon",
      "coordinates": [
        [
          [
            -0.17329216003417966,
            51.51194758264939
          ],
          [
            -0.17303466796874997,
            51.511092905004745
          ],
          [
            -0.1709747314453125,
            51.51023821132554
          ],
          [
            -0.17329216003417966,
            51.51194758264939
          ]
        ]
      ]
    },
    "urls": [
      "http://www.example.org/"
    ],
    "contacts": [
      {
        "tel": null,
        "name": "Andrew Brown",
        "email": "andrew@example.org"
      },
      {
        "tel": null,
        "name": "Megan Jones",
        "email": "megan@example.org"
      }
    ],
    "country": "NG",
    "name": "Lagos Tenure Assessment (old)",
    "description": "Security of Tenure Profiling in Lagos",
    "archived": false,
    "urls": [],
    "contacts": [],
    "access": "public",
    "slug": "lagos-tenure-assessment"
  }
}
```














### List All Projects

```endpoint
GET /api/v1/projects/
```

Use this method to list all the publicly viewable projects in the Cadasta system. You can also see any private projects that you have access to.


**Response**

The response body is an array containing multiple [project JSON objects](#project-json-object).

#### Example Response

```json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": "pw6esdz94iztk4k23hskj73q",
      "organization": {
        "id": "rm4ahxqizjxqbzt3h8itmb3f",
        "slug": "brian-org",
        "name": "Brian Org",
        "description": "",
        "archived": false,
        "urls": [],
        "contacts": []
      },
      "country": "BD",
      "name": "Download Test",
      "description": "",
      "archived": false,
      "urls": [
        ""
      ],
      "contacts": [],
      "access": "public",
      "slug": "download-test",
      "extent": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -0.17329216003417966,
              51.51194758264939
            ],
            [
              -0.17303466796874997,
              51.511092905004745
            ],
            [
              -0.1709747314453125,
              51.51023821132554
            ],
            [
              -0.17329216003417966,
              51.51194758264939
            ]
          ]
        ]
      },
    },
    {
      "id": "jugibdxzaz5i2v3uni5bt6d9",
      "organization": {
        "id": "rm4ahxqizjxqbzt3h8itmb3f",
        "slug": "brian-org",
        "name": "Brian Org",
        "description": "",
        "archived": false,
        "urls": [],
        "contacts": []
      },
      "country": "BD",
      "name": "Import Test",
      "description": "",
      "archived": false,
      "urls": [
        ""
      ],
      "contacts": [],
      "access": "public",
      "slug": "import-test-1",
      "extent": null
    }
  ]
}
```





### List All Projects in an Organization

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/
```

To see all of the projects in an organization, use this method.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).

**Response**

The response body is an array containing multiple [project JSON objects](#project-json-object).

#### Example Response

```json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": "h8ridjt2jazkac4e97srzmh2",
      "organization": {
        "id": "gae6pjf9xygxddgyg5dq45iq",
        "slug": "example-organization",
        "name": "Example Organization",
        "description": "",
        "archived": false,
        "urls": [
          "http://example.com"
        ],
        "contacts": null
      },
      "country": "",
      "name": "Atlanta Project",
      "description": "",
      "archived": false,
      "urls": [
        "http://www.atlanta-example.org"
      ],
      "contacts": null,
      "access": "public",
      "slug": "atlanta-project",
      "extent": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -0.17329216003417966,
              51.51194758264939
            ],
            [
              -0.17303466796874997,
              51.511092905004745
            ],
            [
              -0.1709747314453125,
              51.51023821132554
            ],
            [
              -0.17329216003417966,
              51.51194758264939
            ]
          ]
        ]
      },
    },
    {
      "id": "hxk4k8aee5rh5htahhh5uenn",
      "organization": {
        "id": "gae6pjf9xygxddgyg5dq45iq",
        "slug": "example-organization",
        "name": "Example Organization",
        "description": "",
        "archived": false,
        "urls": [
          "http://example.com"
        ],
        "contacts": null
      },
      "country": "US",
      "name": "Portland Project",
      "description": "",
      "archived": false,
      "urls": [
        ""
      ],
      "contacts": [
        {
          "name": "Kate",
          "email": "kate@example.org",
          "tel": null
        },
        {
          "name": "Oliver",
          "email": "oliver@example.org",
          "tel": "444-555-6789"
        },
        {
          "name": "David",
          "email": null,
          "tel": "555-555-5555"
        }
      ],
      "access": "public",
      "slug": "portland-project",
      "extent": null
    }
  ]
}
```




### List projects using a permissions filter

#### Filtering all projects

```endpoint
GET /api/v1/projects/?permissions={permission[,permission]}
```

#### Filtering organization projects

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/?permissions={permission[,permission]}
```

Using the `permissions` query parameter, the list of projects can be filtered according to the permissions the authenticated user has on the individual project.

If you want to list only project where the user can create parties, you request:

```
GET /api/v1/projects/?permissions=party.create
```

To filter against more than one permission, provide a comma-separated list of these permissions.

```
GET /api/v1/projects/?permissions=party.create,project.update
```

Projects can be filtered using the following permissions:

| Permission | Description |
| --- | --- |
| `project.view`| View the project. |
| `project.view_private`| View the project, if it is private. |
| `project.view_archived`| View the project, if it is archived. |
| `project.update`| Update the project. |
| `project.archive` | Archive the project. |
| `project.unarchive` | Unarchive the project. |
| `project.users.list` | List members of an project. |
| `project.users.add` | Add a member to an project. |
| `project.users.edit` | Edit the permissions of members in the project. |
| `project.users.remove` | Remove a member from the project. |
| `party.list` | List parties in this project. |
| `party.create` | Create a new party for this project. |
| `tenure_rel.list` | List tenure relationships in this project. |
| `tenure_rel.create` | Create a new tenure relationship for this project. |
| `spatial.list` | List spatial units in this project. |
| `spatial.create` | Create a new spatial unit for this project. |




### Create a New Project


```endpoint
POST /api/v1/organizations/{organization_slug}/projects/
```
Use this endpoint to create a new project. Note that all projects must be connected to an organization!

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).


**Request Payload**

Property | Type | Required? | Description
--- | --- | :---: | ---
`name` | `String` | x | The name of the project.
`description` | `String` |  | A long-form description of the project.
`archived` | `Boolean` | | Indicates whether the project has be archived. Defaults to `false`.
`urls` | `Array` | | A list of URLs to websites of this project.
`contacts` | `Array` |  | A list of contacts for this project. A contact is a JSON object containing `name`, `email` (optional) and `tel` (optional).
`access` | `String` | | Indicates whether the project is a `"public"` or a `"private"` one. Defaults to `"public"`.
`extent` | `Object` | A <a href="https://en.wikipedia.org/wiki/GeoJSON#Geometries" target="_blank"> GeoJSON geometry</a> of the project's geographic area.

**Response**

The response body is an array containing a [project JSON object](#project-json-object).

#### Example Response

```json
{
  "id": "h8ridjt2jazkac4e97srzmh2",
  "organization": {
    "id": "gae6pjf9xygxddgyg5dq45iq",
    "slug": "example-organization",
    "name": "Example Organization",
    "description": "",
    "archived": false,
    "urls": [
      "http://example.com"
    ],
    "contacts": null
  },
  "country": "",
  "name": "Atlanta Project",
  "description": "",
  "archived": false,
  "urls": [
    "http://www.atlanta-example.org"
  ],
  "contacts": null,
  "access": "public",
  "slug": "atlanta-project",
  "extent": {
    "type": "Polygon",
    "coordinates": [
      [
        [
          -0.17329216003417966,
          51.51194758264939
        ],
        [
          -0.17303466796874997,
          51.511092905004745
        ],
        [
          -0.1709747314453125,
          51.51023821132554
        ],
        [
          -0.17329216003417966,
          51.51194758264939
        ]
      ]
    ]
  }
}
```





### Get a Project

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/{project_slug}/
```

Use this method to get at a specific project.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).

**Response**

The response body is an array containing a [project JSON object](#project-json-object).


#### Example Response

```json
{
  "id": "hxk4k8aee5rh5htahhh5uenn",
  "organization": {
    "id": "gae6pjf9xygxddgyg5dq45iq",
    "slug": "example-organization",
    "name": "Example Organization",
    "description": "",
    "archived": false,
    "urls": [
      "http://example.com"
    ],
    "contacts": null
  },
  "country": "US",
  "name": "Portland Project",
  "description": "",
  "archived": false,
  "urls": [
    ""
  ],
  "contacts": [
    {
      "name": "Kate",
      "email": "kate@example.org",
      "tel": null
    },
    {
      "name": "Oliver",
      "email": "oliver@example.org",
      "tel": "444-555-6789"
    },
    {
      "name": "David",
      "email": null,
      "tel": "555-555-5555"
    }
  ],
  "users": [],
  "access": "public",
  "slug": "global-project",
  "extent": {
    "type": "Polygon",
    "coordinates": [
      [
        [
          -0.17329216003417966,
          51.51194758264939
        ],
        [
          -0.17303466796874997,
          51.511092905004745
        ],
        [
          -0.1709747314453125,
          51.51023821132554
        ],
        [
          -0.17329216003417966,
          51.51194758264939
        ]
      ]
    ]
  }
}
```



### Update Basic Project Information

```endpoint
PATCH /api/v1/organizations/{organization_slug}/projects/{project_slug}/
```

Use this method to update a project in an organization. The fields of the project that you can edit are shown in the request payload below.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).


**Request Payload**

Using the API, you can update any of the following fields. All of them are optional; fields left blank will remain the same following the update.

Property | Type | Required? | Description
--- | --- | :---: | ---
`country` | `String` | | The country where the project is located; represented as a two-letter <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2" target="_blank">ISO 3166-1 alpha-2</a> code.
`name` | `String` | | The name of the project.
`description`| `String` | | (optional) A long-form description of the project.
`archived` | `Boolean`| | Indicates whether the project has be archived.
`urls` | `Array` | | A list of URLs to websites of this project.
`contacts` | `Array` | | A list of contacts for this project. A contact is a JSON object containing `name`, `email` (optional) and `tel` (optional).
`access` | `String` | | Indicates whether access to the project is restricted; is either `"public"` or `"private"`.

**Response**

The response body is an array containing a [project JSON object](#project-json-object).

#### Example Response

```json
{
  "id": "hxk4k8aee5rh5htahhh5uenn",
  "organization": {
    "id": "gae6pjf9xygxddgyg5dq45iq",
    "slug": "example-organization",
    "name": "Example Organization",
    "description": "",
    "archived": false,
    "urls": [
      "http://example.com"
    ],
    "contacts": null
  },
  "country": "US",
  "name": "Portland Project",
  "description": "",
  "archived": false,
  "urls": [
    ""
  ],
  "contacts": [
    {
      "name": "Kate",
      "email": "kate@example.org",
      "tel": null
    },
    {
      "name": "Oliver",
      "email": "oliver@example.org",
      "tel": "444-555-6789"
    },
    {
      "name": "David",
      "email": null,
      "tel": "555-555-5555"
    }
  ],
  "users": [
    {
      "username": "dpalomino",
      "full_name": "David Palomino",
      "email": "dpalomino@example.org",
      "email_verified": true,
      "last_login": "2016-10-24T14:46:56.317086Z"
    },
    {
      "username": "kate",
      "full_name": "Kate",
      "email": "kate@example.org",
      "email_verified": false,
      "last_login": "2016-10-21T11:00:46.182648Z"
    }
  ],
  "access": "public",
  "slug": "portland-project",
  "extent": {
    "type": "Polygon",
    "coordinates": [
      [
        [
          -0.17329216003417966,
          51.51194758264939
        ],
        [
          -0.17303466796874997,
          51.511092905004745
        ],
        [
          -0.1709747314453125,
          51.51023821132554
        ],
        [
          -0.17329216003417966,
          51.51194758264939
        ]
      ]
    ]
  }
}

```




## Project Members

Project members are users associated with projects in the Cadasta Platform. Using the Cadasta API, you can add, view, update, and delete project members.

The endpoint for project member objects start with `/api/v1/organizations/{organization_slug}/projects/{project_slug}/users/`.

### Project Member JSON Object

A project member JSON object contains the following properties:

Property | Type | Description
---|---|---
`username` | `String` | The user's username (30 characters or fewer. Letters, digits and @/./+/-/_ only.)
`full_name` | `String` | The user's full name. (optional)
`email` | `String` | The user's email address.
`email_verified` | `Boolean` | Boolean indicating whether the user has verified their email address.
`last_login` | `String` | Date and time of last user login.
`role` | `String` | Indicates the role of the user on the project.

The `role` key resolves to:

ID | Title
---|---
A  | Organization administrator or platform superuser (has the same permissions as a project manager)
PM | Project Manager
DC | Data Collector
PU | Project User


##### Example Project Member JSON Object

```json
{
  "username": "kate",
  "full_name": "Kate",
  "email": "kate@example.org",
  "email_verified": false,
  "last_login": "2016-10-21T11:00:46.182648Z",
  "role": "PM"
}
```

### List Project Members

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/{project_slug}/users/
```

Use this method see the members of a project.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).

**Response**

The response contains an array of multiple [project member JSON objects](#project-member-json-object).

#### Example Response

```json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "username": "dpalomino",
      "full_name": "David Palomino",
      "email": "dpalomino@example.org",
      "email_verified": true,
      "last_login": "2016-10-24T14:46:56.317086Z",
      "role": "DC"
    },
    {
      "username": "kate",
      "full_name": "Kate",
      "email": "kate@example.org",
      "email_verified": false,
      "last_login": "2016-10-21T11:00:46.182648Z",
      "role": "PM"
    }
  ]
}
```








### Add a Project Member


```endpoint
POST /api/v1/organizations/{organization_slug}/projects/{project_slug}/users/
```

Use this method to add a new project member to a project.

Note that project members need to already have a user account and be a member of the organization administering the project.

_Learn more about [creating user accounts](#register-a-new-user--create-a-new-user-account) and [adding organization members](#add-an-organization-member)._

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).


**Request Payload**

Property | Type | Required? | Description
--- | --- | :---: | ---
`role` | `String` | x | Indicates the role of the user on the project. (PM = Project Manager, DC = Data Collector, PU = Project User)

**Response**

The response contains a [project member JSON object](#project-member-json-object).


#### Example Response

```json
{
  "username": "jane",
  "full_name": "Jane Doe",
  "email": "jane@example.org",
  "email_verified": false,
  "last_login": "2016-10-27T20:37:19.453868Z",
  "role": "DC"
}
```






### Get a Project Member

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/{project_slug}/users/{username}/
```

Use this method to see a member of a project. This can be helpful if you need to see or change their role in the project.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).
`username` | The username for a specific user, which can be found by [listing organization members](#list-organization-members).



**Response**

The response contains a [project member JSON object](#project-member-json-object).

#### Example Response

```json
{
  "username": "jane",
  "full_name": "Jane Doe",
  "email": "jane@example.org",
  "email_verified": false,
  "last_login": "2016-10-27T20:37:19.453868Z",
  "role": "DC"
}
```







### Update Project Member Permissions

```endpoint
PATCH /api/v1/organizations/{organization_slug}/projects/{project_slug}/users/{username}/
```

This method allows you to update the permissions granted to a project member.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).
`username` | The username for a specific user, which can be found by [listing organization members](#list-organization-members).

**Request Payload**


Property | Type | Required? | Description
--- | --- | :---: | ---
`role` | `String` | x | Indicates the role of the user on the project. (PM = Project manager, DC = Data Collector, PU = Project User)

You can select one of the following permissions:

ID | Title
---|---
PU | Project User
DC | Data Collector
PM | Project Manager

**Response**

The response contains a [project member JSON object](#project-member-json-object).

#### Example Response

```json
{
  "username": "jane",
  "full_name": "Jane Doe",
  "email": "jane@example.org",
  "email_verified": false,
  "last_login": "2016-10-27T20:37:19.453868Z",
  "role": "DC"
}
```




### Remove a Project Member

```endpoint
DELETE /api/v1/organizations/{organization_slug}/projects/{project_slug}/users/{username}/
```

This method removes a member from a project.

**URL Parameters**

URL Parameter | Description
---|---
`organization_slug` | The slug provided for the organization, which can be found by locating the organization in the [list of all organizations](#list-organizations).
`project_slug` | The slug provided for the project, which can be found by [listing all of the projects in an organization](#list-all-projects).
`username` | The username for a specific user, which can be found by [listing organization members](#list-organization-members).

**Response**

If the user was removed successfully from the project, an empty response with status code `204` will be returned.

