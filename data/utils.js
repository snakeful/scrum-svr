module.exports = {
  /**
   * 
   * @param {*} fields Array of fields to set
   * @param {*} obj Object with the fields to be set to new object
   */
  copyFields (fields, obj) {
    console.assert(fields && fields instanceof Array, 'fields must be set and be an Array');
    console.assert(obj, 'obj must be set.');
    return fields.reduce((object, field) => {
      if (obj[field] !== undefined) {
        object[field] = obj[field];
      }
      return object;
    }, {});
  }
};