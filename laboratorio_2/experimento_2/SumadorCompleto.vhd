architecture structural of SumadorCompleto is
    component sumadorCompleto_1bit
    port (
        a, b, cin  : in  std_logic;
        sum, cout : out std_logic
    );
    end component;

    component bin_to_bch_decoder
    port (
        bin_number : in  std_logic_vector(3 downto 0);
        bch_number : out std_logic_vector(10 downto 0)
    );
    end component;

    signal c : std_logic_vector(3 downto 0);
    signal bch_sum : std_logic_vector(10 downto 0);

begin

    u0: sumadorCompleto_1bit port map(a(0), b(0), cin, sum(0), c(0));
    u1: sumadorCompleto_1bit port map(a(1), b(1), c(0), sum(1), c(1));
    u2: sumadorCompleto_1bit port map(a(2), b(2), c(1), sum(2), c(2));
    u3: sumadorCompleto_1bit port map(a(3), b(3), c(2), sum(3), cout);

    bin_to_bch_inst: bin_to_bch_decoder port map(sum, bch_sum);
    sum <= bch_sum(3 downto 0);

end architecture;
