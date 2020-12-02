using Test

include("main.jl")

@testset "Serie" begin
    S = [              4.0, 5.333333333333333, 6.133333333333333, 6.59047619047619,
         6.844444444444444, 6.982972582972582, 7.057564657564657, 7.097347097347097,
         7.118408388996624,  7.12949327933848, 7.135299650469929, 7.138329061495033]

    for n = 1:12
        @test somao(n) == S[n]
    end
    @test somao() == somao(Float64) == (7.141592653589794, 56)

    for T in [Float16, Float32, Float64]
        N = ceil(Int, -log(eps(T)))
        x, k = somao(T)
        @test x - T(π) ≈ T(4)
        @test typeof(x) == T
    end

    for p = 2 .^ (4:15)
        setprecision(p)
        N = ceil(Int, -log(eps(BigFloat)))
        x, k = somao(BigFloat)
        @test x - big(π) ≈ 4
        @test typeof(x) == BigFloat
        @test abs((-0.4896 + 1.0143 * log(k)) / log(N) - 1) < 0.1
    end

    io = IOBuffer()
    tabela(io)
    @test chomp(String(take!(io))) == join(readlines(joinpath(@__DIR__, "tabela.txt")), "\n")
end

@testset "Fracionacci" begin
    @test fracionacci(10) ≈ [1, 3, 2, 7/3, 11/5, 9/4, 29/13, 47/21, 38/17, 123/55]
    @test fracionacci(1) == [1]

    fracionacci_imagens()
end

@testset "Arquivos existem" begin
    @test isfile("fracionacci-imagem.png")
    @test isfile("resposta.txt")
end