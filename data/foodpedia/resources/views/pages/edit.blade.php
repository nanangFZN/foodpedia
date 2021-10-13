<h1>Add Menu</h1>
<form method="post" action="/menu/{{$food->id}}">
@method('PUT')
@csrf
Menu<br>
<input type="text" name="menu" value="{{$food->menu}}"><br>
Description<br>
<input type="text" name="desc" value="{{$food->desc}}"><br>
Price<br>
<input type="text" name="price" value="{{$food->price}}"><br>
Quantity<br>
<input type="text" name="quantity" value="{{$food->quantity}}"><br>
Image<br>
<input type="file" name="image" value={{$food->image}}><br>
Category<br>
<select name="category" value={{$food->category}}>
    <option value="Drink">Drink</option>
     <option value="Desserts">Desserts</option>
      <option value="Main Course">Main Course</option>
</select>
<br>
<input type="submit" value="Save">
</form>