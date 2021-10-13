<h1>Add Menu</h1>
<form method="post" action="/menu">
@csrf
Menu<br>
<input type="text" name="menu"><br>
Description<br>
<input type="text" name="desc"><br>
Price<br>
<input type="number" name="price"><br>
Quantity<br>
<input type="number" name="quantity"><br>
Category<br>
<select name="category">
    <option value="Drink">Drink</option>
     <option value="Desserts">Desserts</option>
      <option value="Main Course">Main Course</option>
</select>
<br>
<input type="submit" value="Save">
</form>