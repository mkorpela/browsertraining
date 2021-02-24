async function myGoToKeyword(page, args, log) {
    log("Hello from myGotoKeyword");
    return await page.goto(args[0]);
}
exports.__esModule = true;
exports.myGoToKeyword = myGoToKeyword;