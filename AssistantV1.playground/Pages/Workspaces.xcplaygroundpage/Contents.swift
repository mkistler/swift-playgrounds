//:## Workspaces

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV1

let assistant = setupAssistantV1()

//:### List workspaces

assistant.listWorkspaces() {
    response, error in

    guard let workspaces = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(workspaces)
}

//:### Create workspace

var workspaceID = "{workspace_id}"

assistant.createWorkspace(name: "API test", description: "Example workspace created via API") {
    response, error in

    guard let workspace = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    workspaceID = workspace.workspaceID
    print(workspace)
}

//:### Get information about a workspace

assistant.getWorkspace(workspaceID: workspaceID) {
    response, error in

    guard let workspace = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(workspace)
}

//:### Update workspace

assistant.updateWorkspace(workspaceID: workspaceID, name: "Updated workspace", description: "Example workspace updated via API.") {
    response, error in

    guard let workspace = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(workspace)
}

//:### Delete workspace

assistant.deleteWorkspace(workspaceID: workspaceID) {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("workspace deleted")
}

