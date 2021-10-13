<h1>Data</h1>
<a href="/menu">Add Menu</a>
<table>
    <thead>
        <tr>
            <th>Menu</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Category</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    @foreach ($foods as $item )
        <tr>
            <td>{{$item->menu}}</td>
            <td>{{$item->desc}}</td>
            <td>{{$item->price}}</td>
            <td>{{$item->quantity}}</td>
            <td>{{$item->category}}</td>
            <td><a href="/menu/{{$item->id}}/edit">Edit</a></td>
        </tr>
    @endforeach
        
    </tbody>
</table>