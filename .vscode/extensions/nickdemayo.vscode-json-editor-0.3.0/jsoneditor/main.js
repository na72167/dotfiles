const vscode = acquireVsCodeApi();

// create the editor
const container = document.getElementById("jsoneditor");

const options = {
    onError: function (err) {
        alert(err.toString());
    },
    onChangeJSON: function (json) {
        const jsonString = JSON.stringify(json, null, 2);
        vscode.postMessage({
            json: jsonString
        });
    }
};

const editor = new JSONEditor(container, options);

window.addEventListener('message', event => {
    const message = event.data; // The JSON data our extension sent
    const json = JSON.parse(message.json);
    editor.update(json);
});
