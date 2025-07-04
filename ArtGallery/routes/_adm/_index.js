// routes/index.js
const express = require("express");
const router = express.Router();
const {
    buscarQtdApreciadores,
    buscarQtdArtistas,
    buscarQtdArtistasAguardandoLiberacao,
    buscarQtdArtistasLiberados,
    buscarQtdAdm,
    buscarQtdBan,
    buscarTotalUsuarios
} = require("../../banco");

router.get("/", async (req, res) => {
    if (!req.session.usuario) return res.redirect("/login")
    const tipo_usu = req.session.usuario.tipo_usu;
    if (tipo_usu !== "adm") return res.redirect("/");

    const qtdApreciadores = await buscarQtdApreciadores();
    const qtdArtistas = await buscarQtdArtistas();
    const qtdArtistasAguardandoLiberacao = await buscarQtdArtistasAguardandoLiberacao();
    const qtdArtistasLiberados = await buscarQtdArtistasLiberados();
    const qtdAdm = await buscarQtdAdm();
    const qtdBan = await buscarQtdBan();
    const totalUsuarios = await buscarTotalUsuarios();

    res.render("_adm/_index", {
        usuario: req.session.usuario,
        title: "Administração - ArtGallery",
        qtdApreciadores,
        qtdArtistas,
        qtdArtistasAguardandoLiberacao,
        qtdArtistasLiberados,
        qtdAdm,
        qtdBan,
        totalUsuarios
    });
});

module.exports = router;