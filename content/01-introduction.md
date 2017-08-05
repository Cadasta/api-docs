## Cadasta API documentation

Welcome to Cadasta's API documentation! These docs will walk you through the different endpoints of the Cadasta platform:

* **Users** :: Managing user [accounts](#managing-a-user-account) - creating, deleting, and amending them as needed;
* **Organizations** :: Creating and editing [organizations](#organizations);
* **Projects** :: Viewing, creating, and modifying [projects](#projects) in the system,
* **Questionnaires** :: Upload new [questionnaires](#questionnaires-1),
* **Locations/Parties/Relationships** :: Adding, modifying and deleting records for:
  * [locations, aka spatial units](#spatial-units-aka-project-locations),
  * [parties](#parties), and
  * [relationships](#relationships) between the location and parties.
* **Resources** :: Adding, modifying, and deleting [project resources](#project-resources), or documentations/photos.

<!-- Mention bulk importing and the structure of Cadasta -->
<!-- include API endpoint visual -->

## Topics

### Reading this Documentation

This documentation is structured by related functionality and then by endpoint. Each endpoint is described using several parts:

* **The HTTP method.** The primary methods you'll see here are `GET`, `POST`, `PATCH`, and `DELETE`.

* **The path**, such as `/api/v1/organizations/{organization_slug}/projects/{project_slug}/spatial/`. All URLs referenced here require their own base path, which may be https://demo.cadasta.org, https://platform.cadasta.org or the URL of your own local instance of the platform. We recommend using `https://demo.cadasta.org/` for testing.

* **Any URL parameters**, a.k.a. parts of the endpoints are wrapped in brackets. In the above path, those would be `{organization_slug}` and `{project_slug}`

Each combination of method and endpoint is described by a request payload, properties, and an example response.

### Using the API

This API works best in one of two scenarios:

1. **You are a developer working with an individual or organization using the Cadasta Platform.** If you have administrator access to the organization you're working for, you'll be able to perform many of the key functions for that organization using your [authorization token](#log-a-user-in--get-authorization-key).

2. **You have created a locally hosted version of the platform.**

If you have any questions about using the API, do not hesitate to <a href="(http://cadasta.org/contact/)" target="_blank">contact us</a>. You can also ask questions on our gitter channel, https://gitter.im/Cadasta/cadasta.

The API is built using the Django REST framework, so you have the ability to view the API properties if you head to the API endpoint, such as https://platform.cadasta.org/api/v1/organizations/.

### Requests

All requests are encoded in `application/json`, unless they involve some kind of file upload. Any exceptions are indicated in the documentation. 

### Common Response Codes

After submitting any API request, you'll get one of the following responses.

Property | Description
---|---
`200`,`201` | The operation has been completed successfully
`400` | There was a problem with the request payload. Usually this means required attributes are missing or the values provided are not accepted. Only applies to the `POST`, `PATCH` and `PUT` requests.
`401` | This request requires a user to be authenticated. You either have not provided an authentication token or the authentication token provided is not valid.
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
