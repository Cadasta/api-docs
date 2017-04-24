## Cadasta API documentation

Welcome to the Cadasta Platform API documentation.

Using this platform API, you can:

* Manage user [accounts](#managing-a-user-account) - creating them, deleting them, and amending them as needed;
* Create and edit [organizations](#organizations);
* View, create, and modify [projects](#projects) in the system,
* Upload new [questionnaires](#questionnaires-1),
* Add, modify and delete records for:
  * [spatial units/project locations](#spatial-units-aka-project-locations),
  * [parties](#parties) associated with these locations, and
  * the [relationships](#relationships) between the two.
* And finally add, modify, and delete [project resources](#project-resources).

Each of the sections listed above outline how to use API endpoints to make these things happen.

## Topics

### Reading this Documentation

This documentation is structured primarily by related functionality and topic, and then by endpoint.

Each endpoint is described using several parts:

* **The HTTP method.** The primary methods you'll see here are `GET`, `POST`, `PATCH`, and `DELETE`.

* **The path**, such as `/api/v1/organizations/{organization_slug}/projects/{project_slug}/spatial/`.

* **Any URL parameters**, a.k.a. parts of the endpoints are wrapped in brackets. In the above path, those would be `{organization_slug}` and `{project_slug}`

In addition, each combination of method and endpoint is described by a request payload, properties, and an example response.

All URLs referenced here require their own base path, which may be your own local instance of the Cadasta Platform. If you'd like to use an existing base path to explore the API, you can use the one for our demo site: `https://demo.cadasta.org/`.

### Using the API

This API works best in one of two scenarios:

1. **You're a developer working with an individual or organization using the Cadasta Platform.** If you have administrator access to the organization you're working for, you'll be able to perform many of the key functions for that organization using your [authorization token](#log-a-user-in--get-authorization-key).

2. **You've created a locally-hosted version of the platform.**

If you have any questions about using the API, please don't hesitate to <a href="(http://cadasta.org/contact/)" target="_blank">contact us</a>.

### Requests

All requests are encoded in `application/json`, unless they involve some kind of file upload. Any exceptions are indicated in the documentation.

### Common Response Codes

After submitting any API request, you'll get one of the following responses.

Response | Description
---|---
`200` | The operation has been completed successfully.
`400` | There was a problem with the request payload. Usually this means required attributes are missing or the values provided are not accepted. Only applies the `POST`, `PATCH` and `PUT` requests.
`401` | This request requires a user to be authenticated. You either have not provided an authentication token or the  authentication token provided is not valid.
`403` | Permission denied, the user has no permission to access this resource or perform this action.
`404` | Not found. (The object with the given slug or ID was not in the database.)

### Formatting URLs for Accessing Specific Objects

To get, create, or modify projects, organizations, organization members and more, you'll need to access certain IDs (such as `username`) or a couple different kinds of slugs.

Two slugs that appear frequently are:

* `organization_slug`, and
* `project_slug`

You can find the `organization_slug` by locating the organization in the [list of all organizations](#list-organizations) and then copying the value of the `slug` property.

You can find most `project_slugs` by [viewing all of the projects in the Cadasta system](#list-all-projects), which returns publicly viewable projects as well as projects you have access to. If it's a private project, you must have access to it and find it by [listing all of the projects in an organization](#list-all-projects).

Once you get your slugs, add them to your endpoint outside of the curly braces.

For example, to get at a specific project, you need to use the following endpoint:

```endpoint
GET /api/v1/organizations/{organization_slug}/projects/{project_slug}/
```

If the `organization_slug` is `sample-organization` and the `project_slug` is `sample-project`, then the endpoint should look like this:

```
GET /api/v1/organizations/sample-organization/projects/sample-project/
```

This API uses many other IDs and slugs, each of which are explained along with the endpoint they are used in.

### Pagination

When listing multiple resources, responses are paginated. This allows the server to return large datasets over a number of requests, avoiding timeouts and enabling clients to reduce wait time by making multiple requests in parallel.

Paginated responses contain the following properties:

Response | Description
---|---
`count` | Total number of resources to be returned.
`next` | URL to next page of data (`null` if not applicable)
`previous` | URL to previous page of data (`null` if not applicable)
`results` | Array of resources that fit within the given page of data. _Note: GeoJSON responses return a single object with a `"type": "FeatureCollection"` and data in the `"features"` property._

Pagination can be controlled with the following query parameters:

Query Paramter | Description
---|---
`limit` | The maximum number of items to return. By default, endpoints return `100` entries per page. Any exceptions are indicated in the documentation.
`offset` | The starting position of the query in relation to the complete set of unpaginated items.

#### JSON Response
```json
{
  "count": 0,
  "next": null,
  "previous": null,
  "results": []
}
```

#### GeoJSON Response
```json
{
  "count": 0,
  "next": null,
  "previous": null,
  "results": {
    "type": "FeatureCollection",
    "features": []
  }
}
```
