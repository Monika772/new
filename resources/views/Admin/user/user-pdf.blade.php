
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
    text-align: left;
   
}
h3 {
  text-align: center;
}
</style>
<h3 >Patanjali Mega Store , Jabalpur</h3>
<table id="table" >
<caption style="font-size:20px;">User List</caption>
            <thead>
            <tr>
              <th>S.No</th>   
              <th>Name</th>
              <th>Email</th>
              <th>Contact No</th>
              <th>Address</th>
              <th>Created Date</th>
            </tr>
            </thead>
            <tbody>
                <?php
                if(!empty($users)){
                    $i=1;
                    foreach($users as $user){ 
                    ?>
                <tr>
                    <th>{{$i}}</th>
                    <th>{{$user->full_name}}</th>   
                    <th>{{$user->email}}</th>
                    <th>{{$user->mobile}}</th>
                    <th>{{$user->address}}</th>
                    <th>{{$user->created_at}}</th>
                 
                </tr>
                  <?php  }
                }
                 ?>
            </tbody>
    </table>