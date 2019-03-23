input = gen_input(1.35, 5, 1000001);
isi = get_ISI(input, 1000);     % Get ISI sequence of size 1000
histogram(isi, 10);
