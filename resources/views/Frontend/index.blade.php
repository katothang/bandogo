@extends('frontend.master.master')
@section('title','Trang Chủ')
@section('content')
		<!-- main -->
		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
						<h2><span>SẢN PHẨM NỔI BẬT</span></h2>
					</div>
				</div>
				<div class="row">
					@foreach ($prd_featured as $item)
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(../backend/img/{{ $item->img }});">
								<div class="cart">
									<p>
										<span class="addtocart"><a href="../../cart/add?id_product={{ $item->id }}"><i
													class="icon-shopping-cart"></i></a></span>
										<span><a href="../../product/{{ $item->slug }}.html"><i class="icon-eye"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="../../product/{{ $item->slug }}.html">{{ $item->name }}</a></h3>
								<p class="price"><span>{{ number_format($item->price,0,"",".") }} đ</span></p>
							</div>
						</div>
					</div>	
					@endforeach						
				</div>
			</div>
		</div>
		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
						<h2><span>SẢN PHẨM MỚI</span></h2>
					</div>
				</div>
				<div class="row">
					@foreach ($prd_new as $item)
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(../backend/img/{{ $item->img }});">
								<p class="tag"><span class="new">New</span></p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="../../cart/add?id_product={{ $item->id }}"><i
													class="icon-shopping-cart"></i></a></span>
										<span><a href="../../product/{{ $item->slug }}.html"><i class="icon-eye"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="../../product/{{ $item->slug }}.html">{{ $item->name }}</a></h3>
								<p class="price"><span>{{ number_format( $item->price,0,"",".") }} đ</span></p>
							</div>
						</div>
					</div>
					@endforeach
				</div>
			</div>
		</div>
		<!-- end main -->
@endsection