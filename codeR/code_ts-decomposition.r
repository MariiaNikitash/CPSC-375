?nottem
class(nottem)
plot(nottem)
as.vector(nottem)
nottem.vec <- as.vector(nottem)
acf(nottem.vec)
nottem.ts <- ts(nottem.vec)
nottem.ts <- ts(nottem.vec, frequency = 12)
decompose(nottem.ts)
plot(decompose(nottem.ts))
nottem.ts <- ts(nottem.vec, frequency = 7)
plot(decompose(nottem.ts))
acf(nottem.vec)
acf(nottem.vec, lag.max = 100)
