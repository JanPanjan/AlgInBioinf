PROBLEM: če zakodiramo besedo ACGT z 0 in 1, tako da je A=00, C=01, T=10, G=11,
potem dobimo 1x večjo besedo. Toda, vsak znak je zapisan (v UTF-8) z 8-biti, vsak
int pa ponavadi s 32-biti. TODA, ko zapišemo samo 0 in 1, naj bi se to zapisalo kot
1-bit/število.

Let's see če to drži. Tu je preprost program, ki zapiše najprej  zaporedje ACGT v svojo
datoteko in nato še 00100111 v svojo.
