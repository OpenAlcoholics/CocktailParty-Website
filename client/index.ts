function addIngredientLine() {
    const el = document.getElementById("ingredient-rows");
    if (!el) {
        return;
    }
    
    var tagString = `
    <tr>
        <th scope="row" class="align-right"><input type="text" class="bg-light form-control" id=""></th>
        <td><input type="number" class="bg-light form-control" id="" value=""></td>
    </tr>`;
    var range = document.createRange();
    range.selectNode(el.childNodes[0]);

    // Make the parent of the first div in the document becomes the context node
    var documentFragment = range.createContextualFragment(tagString);
    console.log(documentFragment);
    el.appendChild(documentFragment);
}

function addAccessoryLine() {
    const el = document.getElementById("accessory-rows");
    if (!el) {
        return;
    }
    
    var tagString = `
    <tr>
        <th scope="row" class="align-right"><input type="text" class="bg-light form-control" id=""></th>
        <td><input type="number" class="bg-light form-control" id="" value=""></td>
    </tr>`;
    var range = document.createRange();
    range.selectNode(el.childNodes[0]);

    // Make the parent of the first div in the document becomes the context node
    var documentFragment = range.createContextualFragment(tagString);
    console.log(documentFragment);
    el.appendChild(documentFragment);
}

function updateShares() {
    const glassSize = Number(document.getElementById("glass-size")!.value);
    const glassUnit = document.getElementById("glass-unit")!.value;
    const ingredients = document.getElementsByClassName("ingredient-row");
    const cocktail: Object = js_cocktail;

    for (let ingredient of ingredients) {
        const ingredientName = ingredient.getElementsByClassName("ingredient-name").item(0)!.textContent;
        console.log(cocktail);
        const item = ingredient.getElementsByClassName("ingredient-share").item(0);
        const share = Number(item!.textContent);
        item!.textContent = `${(glassSize * (share  / 100))} ${glassUnit}`;
    }
}
