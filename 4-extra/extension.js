
async function serverErrors(page, args, log, playwright) {
    return await page.route('**/*', route => {
        route.fulfill({
            status: 500,
            contentType: 'text/plain',
            body: 'Internal Server Error'
        });
    })
}

async function registerMySelector(page, args, log, playwright) {
    log("Some logging from JS");
    log(await page.title());
    playwright.selectors.register("myselector", () => ({
        // Returns the first element matching given selector in the root's subtree.
        query(root, selector) {
          return root.querySelector(`a[data-title="${selector}"]`);
        },

        // Returns all elements matching given selector in the root's subtree.
        queryAll(root, selector) {
          return Array.from(root.querySelectorAll(`a[data-title="${selector}"]`));
        }
    }));
    return 1;
}
exports.__esModule = true;
exports.registerMySelector = registerMySelector;
exports.serverErrors = serverErrors;