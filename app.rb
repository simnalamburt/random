require 'sinatra'
require 'tilt/erubis'

get '/' do
  gen1 = ['소희', '세린이형', '현일이형', '<span style="color: #ccc">재성이형</span>'].shuffle
  gen2 = %w( kcm 동진 장호 지현 ).shuffle
  gen3 = %w( 윤미누나 은서 다윤 가온 ).shuffle
  @groups = []
  for i in 0...4
    @groups[i] = [gen1[i], gen2[i], gen3[i]].shuffle
  end

  erb :index
end

__END__
@@ index
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>스터디</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
  <style>
  body {
    padding-top: 20px;
  }
  </style>
</head>
<body>

<div class="container">
  <div class="jumbotron">
    <h1>바꾸쓰 신입 스터디 <small>랜덤조... 좋아하니?</small></h1>
    <p>자동 사수/부사수/쀼사수 선정 프로그램 ( ͡° ͜ʖ ͡° )</p>
    <p><a id="refresh" class="btn btn-primary btn-lg" role="button">마음에 안들어</a></p>
  </div>

  <div id="content" class="row">
    <% @groups.each_with_index do |group, i| %>
      <div class="col-md-3">
        <div class="panel panel-default">
          <div class="panel-heading"><%= i + 1 %> 조</div>
          <div class="panel-body">
            <%= group.join(', ') %>
          </div>
        </div>
      </div>
    <% end %>
  </div>
</div>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
$('#refresh').click(function() {
  $('#content').load('/ #content > div')
});
</script>
</body>
</html>
