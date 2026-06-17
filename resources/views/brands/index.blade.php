@extends('layouts.app')

@section('content')
    <section>
        <div class="container mt-5">
            <table class="table table-hover align-middle">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nome</th>
                        <th scope="col">descrizione</th>
                        <th scope="col">Logo</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($brands as $brand)
                    <tr>
                        <th scope="row">{{$brand->id}}</th>
                        <td>{{$brand->name}}</td>
                        <td>{{$brand->description}}</td>
                        <td>
                            <img src="{{asset('storage/' . $brand->logo)}}" alt="" class="w-25 h-25">
                        </td>
                        <td>
                            <div class="d-flex gap-1">
                                <button class="btn btn-bd-primary btn-sm">
                                    <i class="bi bi-pencil-fill"></i>
                                </button>
                                <button class="btn btn-bd-secondary btn-sm ">
                                    <i class="bi bi-trash3-fill"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
        </table>
    </div>
</section>
@endsection