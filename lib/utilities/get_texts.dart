getTexts(items, id) {
  try {
    items[int.parse(id)];
  } on RangeError {
    return ["", "", "", "", ""];
  }
  return [
    "${items[int.parse(id)]['activity']}",
    "${items[int.parse(id)]['type']}",
    "${items[int.parse(id)]['price']}",
    "${items[int.parse(id)]['participants']}",
    "${items[int.parse(id)]['accessibility']}"
  ];
}
