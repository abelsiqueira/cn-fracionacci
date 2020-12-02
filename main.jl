using Printf, Plots
gr(size=(600,400))

"""
    S = somao(n)

Neste exercício você deve calcular a soma

    Sₙ = ∑ 2ᵏ⁺¹ (k!)² / (2k)!, k = 0,…,n,

isto é, a série cujo termo é 2^(k+1) * (k!)^2 / (2k)!, onde ! é o fatorial, com n termos.
"""
function somao(n)
    S = 0.0
    ## AQUI
    return S
end

"""
    S = somao(T)

Nesta função você deve calcular a mesma soma que o item anterior com o tipo `T`,
mas a soma deve ser feita até que a adição de um termo novo não faça diferença -
isto é, até a precisão máxima do tipo `T`.
"""
function somao(T::Type = Float64)
    S = nothing
    k = 0
    ## AQUI
    return S, k
end


"""
    tabela()

Produz uma tabela pro somao. Acabe de preenchê-la calculando S e E.
S é a soma com n termos e E é o erro para o valor real da série: π + 4.
"""
function tabela(io::IO = stdout)
    k = 0
    S₀ = 0.0
    S = 1.0
    E = 1.0
    n = 0
    println(io, "|  n | S                 | Erro Abs   |")
    println(io, "|----|-------------------|------------|")
    while S != S₀ && n < 100
        S₀ = S
        # Calcule
        ## AQUI
        s = @sprintf("| %2d | %17.15lf | %10.4e |", n, S, E)
        println(io, s)
        n += 1
    end
end

"""
Os números de Lucas são dados pela sequência

    L₀ = 2,
    L₁ = 1,
    Lₙ = Lₙ₋₁ + Lₙ₋₂, n > 1

começando em t = 1 até n. Considere também os números de Fibonacci Fₙ,

    F₀ = 0,
    F₁ = 1,
    Fₙ = Fₙ₋₁ + Fₙ₋₂, n > 1

já conhecidos.
Queremos calcular

    γₙ = Lₙ / Fₙ, n > 0.

Chamaremos de Fracionacci.

    γ₁ = 1.0, γ₂ = 3.0, γ₃ = 2.0, γ₄ = 7/3, …

A função deve retornar um vetor com TODOS os Fracionaccis até n.

Ex.: fracionacci(3) retorna [1.0, 3.0, 2.0]
"""
function fracionacci(n)
    ## AQUI
    return 1:n
end

"""
Esta função deve fazer 4 gráficos na mesma figura.
Use linha pontilhada e marcador circular de tamanho 3 para cada ponto.

Na posição (1,1), um gráfico de iteração por γ (já preenchido).
Na posição (1,2), um gráfico de iteração por |γ - √5|.
Na posição (2,1), um gráfico de iteração por |γ - √5| na escala log no eixo y.
Na posição (2,2), um gráfico de iteração pela taxa de decréscimo do erro |γₙ - √5| / |γₙ₋₁ - √5|.

Suba o gráfico para o GitHub também.

O que podemos afirmar sobre a convergência da sequência γₙ?
Escreva sua resposta num arquivo resposta.txt e suba para o GitHub também.
"""
function fracionacci_imagens()
    γ = fracionacci(30)
    layout = grid(2, 2)
    p = plot(layout=layout, leg=false)
    plot!(p[1], γ, lw=1, l=:dash, marker='.', ms=3)
    ## AQUI
    png(p, "fracionacci-imagem")
end